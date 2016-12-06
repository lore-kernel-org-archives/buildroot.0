From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 11:28:20 +0100
Subject: [Buildroot] [PATCH v2] raspberrypi-usbboot: new package
In-Reply-To: <1480971546-6460-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 5 Dec 2016 21:59:06 +0100")
References: <1480971546-6460-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a8c95p2z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This new package currently installs the "rpiboot" utility, which is
 > needed to access via USB mass storage the built-in eMMC of Raspberry Pi
 > compute modules.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > +config BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
 > +	bool "host raspberrypi-usbboot"
 > +	depends on BR2_arm

For rpi3 it might be good to add || BR2_aarch64, but that can be done
later.

Committed, thanks.

-- 
Bye, Peter Korsgaard
