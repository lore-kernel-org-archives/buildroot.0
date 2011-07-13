From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 15:03:49 +0200
Subject: [Buildroot] [PATCH] New package: attr
In-Reply-To: <4E1D617D.4080303@visionsystems.de> (Yegor Yefremov's message of
 "Wed, 13 Jul 2011 11:12:29 +0200")
References: <4E1D617D.4080303@visionsystems.de>
Message-ID: <871uxufi2y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Commands for Manipulating Filesystem Extended Attributes.
 Yegor> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
 Yegor> Signed-off-by: Daniel Mack <zonque@gmail.com>
 Yegor> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 Yegor> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

It needs largefile support in the toolchain, otherwise it looks good.

Committed with that change - Thanks everyone.

-- 
Bye, Peter Korsgaard
