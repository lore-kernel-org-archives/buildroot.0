From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Sep 2008 08:59:01 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package: games
	games/ace_of_penguins games/gnuch etc...
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909812D2F@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Tue\,
	2 Sep 2008 13\:49\:12 -0400")
References: <20080829132737.BF3503C864@busybox.net>
	<20080829153841.37df370c@atmel.com>
	<BD79186B4FD85F4B8E60E381CAEE19097AE654@mi8nycmail19.Mi8.com>
	<19223815.post@talk.nabble.com>
	<COL102-DS131551BA49AC350CABE3EFDC630@phx.gbl>
	<19250901.post@talk.nabble.com>
	<BD79186B4FD85F4B8E60E381CAEE1909812D2F@mi8nycmail19.Mi8.com>
Message-ID: <87y729k956.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> I tried to test it this morning by building one of the
 hartleys> games packages (gnuchess) and it never even gets
 hartleys> processed. I think there needs to be a games.mk in
 hartleys> package/games that does a:

 hartleys> include package/games/*/*.mk

Yes, that's needed - I've added it as r23309.

-- 
Bye, Peter Korsgaard
