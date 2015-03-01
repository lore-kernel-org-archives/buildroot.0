From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Mar 2015 09:39:30 +0100
Subject: [Buildroot] [PATCH] package/rpi-firmware: fix config.txt parsing
In-Reply-To: <1425161651-28674-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 28 Feb 2015 23:14:11 +0100")
References: <1425161651-28674-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87lhjhxgal.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The rpi-firmware we currently package has a fiscious bug, that happens
 > in corner cases while reading config.txt (mostly seen on RPi-2, but may
 > also occur on RPi-1).

 > Both the DT-aware and DT-unaware branches are affected.

 > Bump to the latest rpi-firmware to fix that.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Note: this is an urgent fix intended to go into master before the
 > release is cut. This implies we're bringing in RPi-2 support in the
 > rpi-firmware, but there's no way to fix the issue without that.
 > YEM.

Committed, thanks.

-- 
Bye, Peter Korsgaard
