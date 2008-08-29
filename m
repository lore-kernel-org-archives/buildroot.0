From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 29 Aug 2008 15:38:41 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package: games
 games/ace_of_penguins games/gnuch etc...
In-Reply-To: <20080829132737.BF3503C864@busybox.net>
References: <20080829132737.BF3503C864@busybox.net>
Message-ID: <20080829153841.37df370c@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Aug 2008 06:27:37 -0700 (PDT)
laird at uclibc.org wrote:

> Author: laird
> Date: 2008-08-29 06:27:37 -0700 (Fri, 29 Aug 2008)
> New Revision: 23283
> 
> Log:
> games: Move all games into games subdir
> 
> Moved all games into a subdir called games and
> then updated makefiles as necessary.
> 
> If not one objects to this one then I will
> probably do the same for audio next.
> 

EEEEk ;)

The patching done with Makefile.autotools.in does not work with sub
directories in package/ directory, so this will not work anymore.

I have it on my TODO to look into how to fix Makefile.autotools.in to
look for patches in the proper directory.

PS! This might be fixed as well, but it was not fixed 1-2 weeks ago.

-- 
Best regards,
Hans-Christian Egtvedt
