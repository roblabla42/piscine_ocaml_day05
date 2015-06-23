(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: roblabla <robinlambertz+dev@gmail.c>       +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/23 00:03:52 by roblabla          #+#    #+#             *)
(*   Updated: 2015/06/23 00:09:35 by roblabla         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let my_sleep () = Unix.sleep 1

let () =
    if Array.length Sys.argv > 1 then
        let secs = try int_of_string (Array.get Sys.argv 1) with Failure(_) -> 0 in
        for sec = 1 to secs do
            my_sleep ()
        done
