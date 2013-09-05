From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Sep 2013 15:43:13 +0200
Subject: [Buildroot] [PATCH 2/4] configs: bump kernel use for RPi,
	use simpler defconfig
In-Reply-To: <92b005253312c4d36732e01a60a9fdf6ec6660cc.1378330371.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 4 Sep 2013 23:35:54 +0200")
References: <cover.1378330371.git.yann.morin.1998@free.fr>
 <cover.1378330371.git.yann.morin.1998@free.fr>
 <92b005253312c4d36732e01a60a9fdf6ec6660cc.1378330371.git.yann.morin.1998@free.fr>
Message-ID: <87fvtj2xla.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Bump for a slew of USB-related and other fixes.

 Yann> The bcmrpi defconfig is a huge beast with lots of superfluous drivers.
 Yann> The brcmrpi_quick defconfig is a stripped down minimalist defconfig with
 Yann> all that is needed to bring up a RPi with complete HW support, and
 Yann> nothing superfluous, which is what we need for a board's defconfig in
 Yann> buildroot.

Committed, thanks.

-- 
Bye, Peter Korsgaard
