From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:50:36 +0200
Subject: [Buildroot] [PATCH] package/bluez_utils: select
	BR2_PACKAGE_CHECK
In-Reply-To: <20170514195518.9038-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 14 May 2017 21:55:18 +0200")
References: <20170514195518.9038-1-romain.naour@gmail.com>
Message-ID: <87fug6gu77.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Commit [1] added check package to bluez_utils dependencies without
 > selecting it at Kconfig level.

 > Fixes:
 > Makefile:535: *** check is in the dependency chain of bluez_utils that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.

 > [1] 8554be9f82301282161cf6310bacdb6067fefb16

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
