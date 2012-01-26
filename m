From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 14:53:34 +0100
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <4F2158AA.1060508@visionsystems.de> (Yegor Yefremov's message of
 "Thu, 26 Jan 2012 14:44:10 +0100")
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
 <8762fy4otk.fsf@macbook.be.48ers.dk>
 <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
 <4F2158AA.1060508@visionsystems.de>
Message-ID: <87wr8e36zl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 >> Also LINUX_FIRMWARE_FILES_$(CONFIG_FIRMWARE_XXXX) += file1 file2 could be used with $(LINUX_FIRMWARE_FILES_y) to make it even shorter.

 Yegor> How can I use it exactly? Can provide an example?

Just like that. BR2_ Kconfig option expands to 'y' if enabled, and to
the empty string otherwise. See package/mtd/mtd.mk for an example.

-- 
Bye, Peter Korsgaard
