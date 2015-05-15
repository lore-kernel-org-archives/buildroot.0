From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Fri, 15 May 2015 12:36:02 +0300
Subject: [Buildroot] [PATCH v2 1/1] configs/riotboard: bump u-boot to
	version 2015.04
In-Reply-To: <87lhgqcqbg.fsf@dell.be.48ers.dk>
References: <1430807978-24288-1-git-send-email-picmaster@mail.bg>	<55550D5C.7000705@mail.bg>
 <20150515035440.GS2558@tarshish> <87lhgqcqbg.fsf@dell.be.48ers.dk>
Message-ID: <5555BE02.3020908@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Baruch,

On 05/15/2015 09:22 AM, Peter Korsgaard wrote:
>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>
> Hi,
>
>>>> +++ b/configs/riotboard_defconfig
>   >> >@@ -14,7 +14,7 @@ BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
>   >> >
>   >> >  # bootloader
>   >> >  BR2_TARGET_UBOOT=y
>   >> >-BR2_TARGET_UBOOT_VERSION="2015.01"
>   >> >+BR2_TARGET_UBOOT_VERSION="2015.04"
>   >> >  BR2_TARGET_UBOOT_BOARDNAME="riotboard"
>   >> >  BR2_TARGET_UBOOT_FORMAT_IMX=y
>   >>
>   >> FYI - don't want to push anyone, but just don't see my resent patch in
>   >> Patchwork, so I was concerned it was "lost in space".
>
>   > Your patch is at http://patchwork.ozlabs.org/patch/467928/. Peter has
>   > apparently marked the patch as "Accepted", although it is clearly not.
>
> Yes, it is - To the next branch. I added it on the 7th, and replied to
> the mail:
>
> http://lists.busybox.net/pipermail/buildroot/2015-May/127991.html
>
> Nikolay, didn't you receive my mail?

Thanks a lot. It turned out that I actually received your confirmation,
but my email client filter sorted your email in the wrong folder,
due to a mistake on my side. It should be better now :).

Have a nice weekend,
Nikolay
