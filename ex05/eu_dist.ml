(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   eu_dist.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla <robinlambertz+dev@gmail.c>       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 11:39:53 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/23 11:50:22 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let eu_dist a b =
    if Array.length a <> Array.length b then
        invalid_arg "Lenght of a <> Length of b"
    else begin
        let len = Array.length a in
        let sum = ref 0. in
        for i = 0 to (len-1) do
            print_float !sum;print_endline"";
            sum := !sum +. (((Array.get a i) -. (Array.get b i)) ** 2.)
        done;
        sqrt !sum
    end

let () =
    print_float (eu_dist [|1.0; 3.0; 2.0 |] [|2.0; 4.0; 2.0|])
