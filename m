From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 22:16:08 +0200
Subject: [Buildroot] [PATCH] linux-firmware: bump version
In-Reply-To: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 15 Sep 2016 14:56:53 -0300")
References: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87poo4dilz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > And copy firmware for BCM43430 and BCM43438, hence rpi3 wifi support at
 > last.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

Will you send a patch to add BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX to
the rpi3 defconfig?

-- 
Bye, Peter Korsgaard
