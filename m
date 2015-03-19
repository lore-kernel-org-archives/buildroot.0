From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 22:28:21 +0100
Subject: [Buildroot] [PATCH] configs: add defconfig for Freescale i.MX31
	PDK
In-Reply-To: <550B3F16.60600@mind.be>
References: <1426585422-22441-1-git-send-email-vincent.stehle@freescale.com>
 <550A0AF9.5050101@mind.be> <550AED3F.4070606@freescale.com>
 <550B3F16.60600@mind.be>
Message-ID: <550B3F75.6030205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/15 22:26, Arnout Vandecappelle wrote:
>> On the other hand, if we stay with network booting, initramfs is
>> > a nice idea as it makes the setup simpler indeed. Also, the
>> > i.MX31 PDK has 128 MB of memory, so this is a practical solution.
>> >   I just tested and an initramfs included in the zImage works
>> > fine. Only, Freescale "official" kernel has no support for
>> > initrd/initramfs, so we need another patch.
>  Er, you say that initramfs works but it isn't supported? WTF?

 Sorry, just saw the patch that enables it in your v2 :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
