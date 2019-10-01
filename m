From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 11:45:27 +0200
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: use default
 console device
In-Reply-To: <20190930060447.7377-1-yegorslists@googlemail.com> (yegorslists's
 message of "Mon, 30 Sep 2019 08:04:47 +0200")
References: <20190930060447.7377-1-yegorslists@googlemail.com>
Message-ID: <878sq4ztmw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > OMAP kernels use 8250 driver by default. Hence the name of
 > the console device is not /dev/ttyO0 but /dev/ttyS0.
 > Use /dev/console in order to handle the console independently
 > of the selected driver.

 > Tested in BeagleBone Black board.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
