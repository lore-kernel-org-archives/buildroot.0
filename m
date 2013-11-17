From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 18:58:45 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131117172917.GB4425@free.fr> (Yann E. MORIN's message of "Sun, 
 17 Nov 2013 18:29:17 +0100")
References: <20131116223632.462c6e60@skate> <20131117172917.GB4425@free.fr>
Message-ID: <87k3g6ykoa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Here are a few analysis of some of the build failures:

 > http://autobuild.humanoidz.org/results/a60/a60a63163288af14f701adfdfa9f62229c983984/
 -> unable to download the toolchain from mentor.com
 -> I was able to download the toolchain OK from here
 -> temporary glitch in network or on the server?

It also works here, so I guess so.

 > http://autobuild.humanoidz.org/results/6aa/6aa47858a511e89b0bd6a3a472276baab65afb1c/
 -> Cannot execute cross-compiler '/path/to/toolchain/usr/bin/nios2-linux-gcc'

 > For the last three failures above, can it be that the .config file is
 > improperly tweaked by the test framework?

It seems like it. This /path/to/toolchain/usr is the default path when a
custom external toolchain is used.

-- 
Bye, Peter Korsgaard
