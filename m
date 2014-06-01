From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 23:12:46 +0200
Subject: [Buildroot] [PATCH 02/26] configs: bump kernel used for the RPi
In-Reply-To: <32a3ef4762be156ec7d7b17419df1e8b60d9f1da.1401656581.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 1 Jun 2014 23:03:26 +0200")
References: <cover.1401656581.git.yann.morin.1998@free.fr>
 <32a3ef4762be156ec7d7b17419df1e8b60d9f1da.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <87k3901ghd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The rpi-3.12.y branch has now been merged with the 3.12.20 upstream,
 > and contains some fixes for FIQ, v4l2, i2c, USB, and 1-wire GPIOs.

 > Bump kernel headers used for the toolchain at the same time.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
