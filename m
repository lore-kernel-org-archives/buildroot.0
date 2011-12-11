From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2011 13:40:47 +0100
Subject: [Buildroot] [PATCH 1/1] New Package libmbus library for
 communicating with M-bus devices.(rework)
In-Reply-To: <8C82EF97265D4A6DA5ED238B24FD8DC0@JohanW7>
References: <1323478080-2915-1-git-send-email-sagaert.johan@skynet.be>
 <20111210154619.2fdaccf8@skate>
 <8C82EF97265D4A6DA5ED238B24FD8DC0@JohanW7>
Message-ID: <20111211134047.003e334d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

Please keep the Buildroot list Cc'ed.

Le Sat, 10 Dec 2011 18:26:31 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> Yes, i just saw it, I started using git only since last week, and I used
>  --signed-off instead of --signoff. Still need to learn a lot and do some
> tuning in the .gitconfig file. Will create some script so I don't forget any
> mandatory options.

No problem. Don't worry if everything is not perfect the first time:
that's why we have code review. Even experienced developers don't
always get everything right.

> One more question: is it OK to comment in the xxx.mk files ?
> (I have a libcgi patch and i included a comment line why I added the
> AUTORECONF option.) 

Yes, it is perfectly ok, and even better, in your case, I think it was
a very good idea. Having _AUTORECONF=YES is strange when no patch is
changing the configure.ac or Makefile.in files, so having a short
comment justifying the usage of _AUTORECONF=YES is welcome.

> I use qgit and smartgit gui-clients, do you suggest something better ?)

I do all my git stuff using the git command line utility, and I've
never tried any of the graphical stuff for git (except gitk for pure
visualization of git history).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
