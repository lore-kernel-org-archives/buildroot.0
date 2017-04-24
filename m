From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:32:49 +0200
Subject: [Buildroot] [PATCH 1/1] uboot: fix target uboot defconfig
	warning
In-Reply-To: <20170421195707.5238-1-christian@paral.in> (Christian Stewart's
 message of "Fri, 21 Apr 2017 15:57:07 -0400")
References: <20170421195707.5238-1-christian@paral.in>
Message-ID: <87efwhtxcu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > The warning currently reads:
 >   No board defconfig name specified, check your
 >   BR2_TARGET_UBOOT_DEFCONFIG setting.

 > It should read:

 >   No board defconfig name specified, check your
 >   BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting.

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
