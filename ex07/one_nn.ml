(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   one_nn.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla <robinlambertz+dev@gmail.c>       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 15:12:15 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/23 15:53:49 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type radar = float array * string

let eu_dist a b =
    if Array.length a <> Array.length b then
        invalid_arg "Lenght of a <> Length of b"
    else begin
        let len = Array.length a in
        let sum = ref 0. in
        for i = 0 to (len-1) do
            sum := !sum +. (((Array.get a i) -. (Array.get b i)) ** 2.)
        done;
        sqrt !sum
    end

let one_nn (radarsval : radar list) ((farr, str) : radar) =
    let (radars, closest_name, closest_dist) = match radarsval with
        | (arr, name) :: t -> (ref t, ref name, ref (eu_dist arr farr))
        | [] -> invalid_arg "Radar list empty"
    in
    while !radars <> [] do
        match !radars with
        | (farr2, str2) :: b -> begin
            let dist = eu_dist farr farr2 in
              if dist < !closest_dist then begin
                closest_dist := dist;
                closest_name := str2
              end;
            radars := b
        end
        | [] -> ()
    done;
    !closest_name

let () =
    let examples_of_file path : radar list =
        let csvlst = ref [] in
        let process_line line =
            let floats = ref [] in
            let i = ref 0 in
            try
                while !i < String.length line do
                    let j = String.index_from line !i ',' in
                    floats := float_of_string (String.sub line !i (j - !i)) :: !floats;
                    i := j + 1
                done;
                (Array.of_list (List.rev !floats), "")
            with Not_found ->
                (Array.of_list (List.rev !floats), String.sub line !i (String.length line - !i))
        in
        let chan = open_in path in
        try
            while true; do
                csvlst := process_line (input_line chan) :: !csvlst
            done;
            !csvlst
        with End_of_file ->
            close_in chan;
            !csvlst
    in
    let testarr = examples_of_file "../ex06/ionosphere.test.csv" in
    let rec test = function
        | a :: t -> (print_endline (one_nn testarr a); test t)
        | [] -> ()
    in
    test (examples_of_file "../ex06/ionosphere.train.csv")
