From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 May 2010 10:16:07 +0200
Subject: [Buildroot] serial console and wpa_supplicant
In-Reply-To: <j2kc72f6b301005061540yb1d26da4gb3d5383b4fa4f476@mail.gmail.com>
	(mohamed mohamed nour eldin's message of "Fri, 7 May 2010 01:40:57
	+0300")
References: <j2kc72f6b301005061540yb1d26da4gb3d5383b4fa4f476@mail.gmail.com>
Message-ID: <878w7w86uw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "mohamed" == mohamed mohamed nour eldin <eng.mohamed.nour.eldin@gmail.com> writes:

 mohamed> hi,

 mohamed> first of all, we want to thank u very much for developing this
 mohamed> fantastic tool which helped us a lot in building a linux

You are welcome.

 mohamed> 2- when building a systen with wpa_supplicant package, we face
 mohamed> an error: ld can't find -lnl, although libnl was built
 mohamed> successfully

Could you provide more details, please?

What buildroot version are you using? There was a wpa_supplicant fix
yesterday for external toolchains.

Please post your buildroot .config file, so I can try to reproduce the
problem.

-- 
Bye, Peter Korsgaard
