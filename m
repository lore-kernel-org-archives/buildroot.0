From: hartleys <hartleys@visionengravers.com>
Date: Fri, 29 Aug 2008 12:53:08 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package: games
	games/ace_of_penguins games/gnuch etc...
In-Reply-To: <20080829153841.37df370c@atmel.com>
References: <20080829132737.BF3503C864@busybox.net>
	<20080829153841.37df370c@atmel.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19097AE654@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, August 29, 2008 6:39 AM, Hans-Christian Egtvedt wrote:
> On Fri, 29 Aug 2008 06:27:37 -0700 (PDT) laird at uclibc.org wrote:
>> Author: laird
>> Date: 2008-08-29 06:27:37 -0700 (Fri, 29 Aug 2008) New Revision:
23283
>> 
>> Log:
>> games: Move all games into games subdir
>> 
>> Moved all games into a subdir called games and then updated makefiles

>> as necessary.
>> 
>> If not one objects to this one then I will probably do the same for 
>> audio next.
>> 
>
> EEEEk ;)
>
> The patching done with Makefile.autotools.in does not work with sub
> directories in package/ directory, so this will not work anymore.
>
> I have it on my TODO to look into how to fix Makefile.autotools.in
> to look for patches in the proper directory.
>
> PS! This might be fixed as well, but it was not fixed 1-2 weeks ago.

In another post Daniel Laird says:

> I have tried building the games/ace_of_penguins and packages in
> java/jamvm and it is applying the patches that I expect it to.
> If anyone else finds this to be wrong then I will reverse this
> change or fix Makefile.autotools.in but for now it appears to be
> patching all correctly.

I brought up this problem with last week with a different package so I
tried building it again based on the current svn. Still no luck getting
the patches to apply. My .mk looks pretty much like the one for
ace_of_penguins so I think Makefile.autotools.in still has a problem
patching sub directories.

Just my 2 cents....

Hartley Sweeten
