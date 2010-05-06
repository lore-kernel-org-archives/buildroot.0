From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 May 2010 22:57:53 +0200
Subject: [Buildroot] Build Error!
In-Reply-To: <u2sa3e4d2d61005010435i99dc0cfbi6ab02762e7788da1@mail.gmail.com>
	(Sameer Bobade's message of "Sat, 1 May 2010 17:05:10 +0530")
References: <j2ma3e4d2d61005010430hb5d94b22ia8ce4d39a84c52a7@mail.gmail.com>
	<u2sa3e4d2d61005010435i99dc0cfbi6ab02762e7788da1@mail.gmail.com>
Message-ID: <87tyqk929a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sameer" == Sameer Bobade <skbobade@gmail.com> writes:

 Sameer> Hi,
 Sameer> I am trying to build the Linux Kernel 2.6 for i386 core 2.

 Sameer> I gave make command after configuration and during the process of?gmp following
 Sameer> error came:


 Sameer> configure: WARNING: you should use --build, --host, --target
 Sameer> configure: WARNING: you should use --build, --host, --target
 Sameer> configure: error: --target is not appropriate for GMP
 Sameer> Use --build=CPU-VENDOR-OS if you need to specify your CPU and/or system
 Sameer> explicitly. ?Use --host if cross-compiling (see "Installing GMP" in the
 Sameer> manual for more on this).
 Sameer> make: *** [/home/Sameer/buildroot-2010.02/output/toolchain/gmp-4.2.4-host
 Sameer> /.configured] Error 1

Strange - Could you provide some more details please? (E.G. what were
the lines above these, what is your buildroot .config?)

-- 
Bye, Peter Korsgaard
