From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Nov 2009 14:14:18 +0100
Subject: [Buildroot] libtiff compilation fails when libjpeg62-dev is
	present on host
In-Reply-To: <4d28d4b50911230452u418996aexe3d1a6ac1dd63ea@mail.gmail.com>
	(Lionel Landwerlin's message of "Mon\,
	23 Nov 2009 13\:52\:37 +0100")
References: <20091109071956.GC26599@jasper.tkos.co.il>
	<1257806614.24296.9.camel@coalu.atr>
	<20091110063659.GA5220@jasper.tkos.co.il>
	<4d28d4b50911190701h2f580cc9kf89cd32795949467@mail.gmail.com>
	<20091119151320.GC21551@jasper.tkos.co.il>
	<4d28d4b50911190720s72ed6df5s29d9f52aeb2cce3f@mail.gmail.com>
	<20091123065654.GD6897@jasper.tkos.co.il>
	<4d28d4b50911230221u574da4efic80712133917b766@mail.gmail.com>
	<20091123113439.GG6897@jasper.tkos.co.il>
	<4d28d4b50911230452u418996aexe3d1a6ac1dd63ea@mail.gmail.com>
Message-ID: <87my2de639.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> Ok cool.

 Lionel> I didn't identify the problem with some external toolchain. I
 Lionel> had this problem with an sh4-stlinux one, but not with an
 Lionel> x86-intel one and it seems Thomas didn't had any problem with
 Lionel> its arm-whatever toolchains.

 Lionel> I'm working on a configuration choice in the toolchain's
 Lionel> configuration to force autoreconf/libtool patching for some
 Lionel> external toolchains.

 Lionel> Peter: What do think about such an option ?

I would like to first really understand what the problem is and why not
everyone is seeing it.

Can you bring it up again post-2009.11?

-- 
Bye, Peter Korsgaard
