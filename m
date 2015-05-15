From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 08:22:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] configs/riotboard: bump u-boot to
	version 2015.04
In-Reply-To: <20150515035440.GS2558@tarshish> (Baruch Siach's message of "Fri, 
 15 May 2015 06:54:40 +0300")
References: <1430807978-24288-1-git-send-email-picmaster@mail.bg>
 <55550D5C.7000705@mail.bg> <20150515035440.GS2558@tarshish>
Message-ID: <87lhgqcqbg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

>> >+++ b/configs/riotboard_defconfig
 >> >@@ -14,7 +14,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
 >> >
 >> >  # bootloader
 >> >  BR2_TARGET_UBOOT=y
 >> >-BR2_TARGET_UBOOT_VERSION="2015.01"
 >> >+BR2_TARGET_UBOOT_VERSION="2015.04"
 >> >  BR2_TARGET_UBOOT_BOARDNAME="riotboard"
 >> >  BR2_TARGET_UBOOT_FORMAT_IMX=y
 >> 
 >> FYI - don't want to push anyone, but just don't see my resent patch in
 >> Patchwork, so I was concerned it was "lost in space".

 > Your patch is at http://patchwork.ozlabs.org/patch/467928/. Peter has 
 > apparently marked the patch as "Accepted", although it is clearly not.

Yes, it is - To the next branch. I added it on the 7th, and replied to
the mail:

http://lists.busybox.net/pipermail/buildroot/2015-May/127991.html

Nikolay, didn't you receive my mail?

-- 
Venlig hilsen,
Peter Korsgaard 
