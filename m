From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 16 Sep 2016 20:11:17 +0200
Subject: [Buildroot] [PATCH] linux-firmware: bump version
In-Reply-To: <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar>
References: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
 <87poo4dilz.fsf@dell.be.48ers.dk>
 <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar>
Message-ID: <02eb48ef-5659-9364-a55c-6f9c17ca0a82@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/16/2016 07:54 PM, Gustavo Zacarias wrote:
> On 2016-09-15 17:16, Peter Korsgaard wrote:
>
>> Committed, thanks.
>>
>> Will you send a patch to add BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX to
>> the rpi3 defconfig?
>
> Hi.
> Well, without some $WiFi package (hostapd, wpa_supplicant, 
> wireless-tools) just copying the firmware serves no purpose, though it 
> can be done for completeness.
> That being said, i lack a rpi3.

And unless that changed recently, just the .bin the patch added wouldn't 
be sufficient for Pi 3.
Also need: 
https://github.com/RPi-Distro/firmware-nonfree/blob/master/brcm80211/brcm/brcmfmac43430-sdio.txt


Yours sincerely,

Floris Bos
