From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Apr 2011 20:05:00 +0200
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <1303322103.8512.4.camel@segulix> (Sergio Monteiro Basto's
	message of "Wed, 20 Apr 2011 18:55:02 +0100")
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk>
	<1301952165.27248.2.camel@segulix>
	<87pqogj49u.fsf@macbook.be.48ers.dk> <1303322103.8512.4.camel@segulix>
Message-ID: <878vv423zn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Monteiro Basto <sergio@sergiomb.no-ip.org> writes:

Hi,

 Sergio> After you fix the build error, I wrote that we should built
 Sergio> ncurses with configure option --with-termlib=tinfo , which
 Sergio> Fedora use by default .  And you wrote to make a "patch adding
 Sergio> optional tinfo build" , I done one draft of the patch.

 Sergio> Since this bug in runtime, seems to be with terminfo, build with option
 Sergio> --with-termlib=tinfo , doesn't solve the problem ? 

I haven't tried, but doesn't that just shuffle part of the ncurses
functions into libtinfo? I don't right away see why that would fix
anything, but I'll start a build now.

Besides this hypothetical fix, is there any other reason why
--with-termlib=tinfo would be preferable?

-- 
Bye, Peter Korsgaard
