From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 12:58:23 -0600
Subject: [Buildroot] Build jobbing
In-Reply-To: <200911280539.00806.minimod@morethan.org>
References: <200911271522.58858.minimod@morethan.org>
	<200911280510.28749.minimod@morethan.org>
	<200911280539.00806.minimod@morethan.org>
Message-ID: <200911281258.25817.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Michael S. Zick wrote:
> 
> After running the uClibc test suite, I'll try the Lua numerical test suite.
> Lua only has one internal number type: Double. So if that works....
> 
> Mike
> > I am gaining confidence that I have most (all?) of the cockpit
> > errors out of my setup here.
> > 

Well, not quite all of the cockpit error:

/ # chroot /tmp/work
/ # lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> print(math.sin(12))
table index is NaN
> os.exit()
/ #

Takes deep breath, starts over with those compiler and build options.  ;)

Mike
