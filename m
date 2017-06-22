From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 23:23:46 +0200
Subject: [Buildroot] [PATCH 4/4] spice: add post-0.12.8 upstream
	security fixes
In-Reply-To: <20170622203700.GG3054@scaer> (Yann E. MORIN's message of "Thu,
 22 Jun 2017 22:37:00 +0200")
References: <20170621220744.18908-1-peter@korsgaard.com>
 <20170621220744.18908-5-peter@korsgaard.com>
 <20170622203700.GG3054@scaer>
Message-ID: <87mv8zlnrx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,
 >> create mode 100644 package/spice/0003-main-channel-Prevent-overflow-reading-messages-from-.patch

 > Although this is not strictly speaking a security fix, I woner if we
 > should not backport 1d597f4b1 (Call migrate_end_complete() after falling
 > back to switch-host) as it fixes a migration issue with qemu 2.6.

Yes, that might be a good idea as a followup patch as it is such a
simple patch and fixes real issue.

 > Anyway:

 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for the reviews!

-- 
Bye, Peter Korsgaard
