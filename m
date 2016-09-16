From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 16 Sep 2016 14:54:18 -0300
Subject: [Buildroot] [PATCH] linux-firmware: bump version
In-Reply-To: <87poo4dilz.fsf@dell.be.48ers.dk>
References: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
 <87poo4dilz.fsf@dell.be.48ers.dk>
Message-ID: <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-09-15 17:16, Peter Korsgaard wrote:

> Committed, thanks.
> 
> Will you send a patch to add BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX to
> the rpi3 defconfig?

Hi.
Well, without some $WiFi package (hostapd, wpa_supplicant, 
wireless-tools) just copying the firmware serves no purpose, though it 
can be done for completeness.
That being said, i lack a rpi3.
Regards.
