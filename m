From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 23:49:12 +0200
Subject: [Buildroot] [PATCH 1/3 v4] uboot: Add support for U-Boot SPL
In-Reply-To: <1332108292-28094-2-git-send-email-n-dechesne@ti.com> (Nicolas
 Dechesne's message of "Sun, 18 Mar 2012 23:04:50 +0100")
References: <1332108292-28094-1-git-send-email-n-dechesne@ti.com>
 <1332108292-28094-2-git-send-email-n-dechesne@ti.com>
Message-ID: <87sjfeb8o7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Dechesne <n-dechesne@ti.com> writes:

 Nicolas> SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
 Nicolas> and should now be used.

 Nicolas> This patch ensures that either SPL or xloader can be selected.

 Nicolas> A config variable has been added for the name of the SPL
 Nicolas> binary generated during u-boot build. For most platform it is
 Nicolas> u-boot-spl.bin but not always.  It is MLO on OMAP for example.

Committed, thanks - And sorry for the slow response.

-- 
Bye, Peter Korsgaard
