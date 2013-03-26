From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Mar 2013 14:01:25 +0100
Subject: [Buildroot] [PATCH 01/15] configs: add RaspberryPi defconfig
In-Reply-To: <9ac29744b5477393a3b0b2340c9eafd402179205.1364253936.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 26 Mar 2013 00:27:56 +0100")
References: <cover.1364253936.git.yann.morin.1998@free.fr>
 <cover.1364253936.git.yann.morin.1998@free.fr>
 <9ac29744b5477393a3b0b2340c9eafd402179205.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <87wqsu8gd6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 Yann> This is a default configuration for the RaspberryPi, tested and functionnal.

 Yann> The kernel used is the one developped by the RaspberryPi foundation as it's not
 Yann> fully supported currently in mainline kernel.
 Yann> The configuration used for the kernel is the default bcmrpi.

 Yann> For more info, please find board/raspberrypi/README.txt

Committed with minor tweaks to the readme. I've also renamed it to
readme.txt to match the other boards.

-- 
Bye, Peter Korsgaard
