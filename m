From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Sep 2016 20:14:04 +0200
Subject: [Buildroot] [PATCH] linux-firmware: bump version
In-Reply-To: <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar> (Gustavo
 Zacarias's message of "Fri, 16 Sep 2016 14:54:18 -0300")
References: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
 <87poo4dilz.fsf@dell.be.48ers.dk>
 <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar>
Message-ID: <874m5fd85v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 2016-09-15 17:16, Peter Korsgaard wrote:
 >> Committed, thanks.
 >> 
 >> Will you send a patch to add BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX to
 >> the rpi3 defconfig?

 > Hi.
 > Well, without some $WiFi package (hostapd, wpa_supplicant,
 > wireless-tools) just copying the firmware serves no purpose, though it
 > can be done for completeness.

True. We already enable wpa-supplicant for a number of defconfigs, so
probably that is the best option.

 > That being said, i lack a rpi3.

Me too.

-- 
Venlig hilsen,
Peter Korsgaard 
