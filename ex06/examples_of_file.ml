(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   examples_of_file.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla <robinlambertz+dev@gmail.c>       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 11:51:24 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/23 12:30:54 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let examples_of_file path =
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

let () =
    let print_it (arr, g) =
        (Array.iter (fun x -> print_float x; print_string ", ") arr; print_endline g)
    in
    List.iter print_it (examples_of_file "ionosphere.test.csv")
