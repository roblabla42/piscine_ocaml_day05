(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla <robinlambertz+dev@gmail.c>       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 09:48:28 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/23 10:22:13 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    if Array.length Sys.argv < 2 then
        print_endline "Usage : ./a.out <jokes file>"
    else begin
        let jokeslist = ref [] in
            let chan = open_in (Array.get Sys.argv 1) in
            try
                while true; do
                    jokeslist := input_line chan :: !jokeslist
                done;
            with End_of_file ->
                close_in chan;
                Random.self_init ();
                let jokes = Array.of_list (List.rev !jokeslist) in
                print_endline (Array.get jokes (Random.int (Array.length jokes)))
    end
