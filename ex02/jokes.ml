(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla <robinlambertz+dev@gmail.c>       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 09:48:28 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/23 09:59:40 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let jokes = Array.of_list (
                   "I think I want a job cleaning mirrors. It's something I could really see myself doing."
                :: "What does a clock do when it's hungry ? It goes back four seconds."
                :: "Why did the tomato blush ? Because it saw the salad dressing."
                :: "What do you call a belt made out of watches ? A waist of time."
                :: "Why are there fences around a graveyard ? Because people are dying to get in."
                :: [])
    in
    (Random.self_init ();
    print_endline (Array.get jokes (Random.int (Array.length jokes))))
