From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Fri, 29 Aug 2008 19:16:45 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: games
	games/ace_of_penguins games/gnuch etc...
In-Reply-To: <20080829132737.BF3503C864@busybox.net><20080829153841.37df370c@atmel.com><BD79186B4FD85F4B8E60E381CAEE19097AE654@mi8nycmail19.Mi8.com>
	<19223815.post@talk.nabble.com>
References: <20080829132737.BF3503C864@busybox.net><20080829153841.37df370c@atmel.com><BD79186B4FD85F4B8E60E381CAEE19097AE654@mi8nycmail19.Mi8.com>
	<19223815.post@talk.nabble.com>
Message-ID: <COL102-DS131551BA49AC350CABE3EFDC630@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not sure my ace_of_penguins check was valid.

However jamvm is definately ok and that lives in a subdir.
I believe that the problem might lie not in subdirs specifically but in 
Makefile.autotools.in handling of packages called one thing and living in 
another directory or a combination of packages in subdirs with a name that 
does not match the extracted directory path

ace_of_penguins lives in a directory called ace.
Maybe this is common to the packages you have suggested are failing.

I will look into this on monday
Daniel

--------------------------------------------------
From: "Daniel Laird" <daniel.j.laird@nxp.com>
Sent: Friday, August 29, 2008 5:59 PM
To: <buildroot@uclibc.org>
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package: games 
games/ace_of_penguins games/gnuch etc...

>
> what package were you having issues with?
> The more I can test the better currently I can see that the patch target
> succeeds and patches the correct files if I build jamvm or ace_of_penguins
> both of which live in subdirs.
>
> I will try again ASAP (monday now) but the more bad cases I have the 
> better
> I can solve this - I want to try and keep this change but not at the 
> expense
> of everyone else :-)
>
> Daniel
> -- 
> View this message in context: 
> http://www.nabble.com/svn-commit%3A-trunk-buildroot-package%3A-games-games-ace_of_penguins-games-gnuch-etc...-tp19219940p19223815.html
> Sent from the BuildRoot mailing list archive at Nabble.com.
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
