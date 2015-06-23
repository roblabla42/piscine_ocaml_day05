(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_ref.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla <robinlambertz+dev@gmail.c>       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 00:15:09 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/23 11:54:39 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a ft_ref = { mutable inside : 'a }

let return x = { inside = x }
let get ref = ref.inside
let set ref x = ref.inside <- x
let bind ref f : 'b ft_ref = f (get ref)

let () =
    let my_ref = return 12 in
    (print_int (get my_ref);
    print_endline "";
    set my_ref 42;
    print_int (get my_ref);
    print_endline "";
    let my_ref2 = bind my_ref (fun x  -> return (2 * x)) in
    (print_int (get my_ref2);
    print_endline "";))
