From: =?UTF-8?B?QXJuYXVkIFLDqWJpbGxvdXQ=?= <rebillout@syscom.ch>
Date: Wed, 19 Dec 2012 14:03:25 +0100
Subject: [Buildroot] [PATCH] package/uboot-tools: Add mkenvimage for
	host.
In-Reply-To: <20121219135800.6182a9ba@skate>
References: <50D1B74F.805@syscom.ch> <20121219135800.6182a9ba@skate>
Message-ID: <50D1BB1D.3090907@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mr. Petazzoni,

>   *) Could you send a proper git patch, with a description,
>   Signed-off-by line, and sent using git send-email so that it doesn't
>   get line-wrapped by your mail client.
Ok I will look at that and do my best.

>   *) I would like to see an option being added in the U-Boot
>   configuration options to pass a txt file containing an environment
>   definition, which would be passed through mkenvimage to generate an
>   image environment, and then installed in $(BINARIES_DIR). Could you
>   cook such a patch, or do you prefer if someone else does it?
Sounds good to me, I will send you a new patch. Hopefully before the end 
of the week.

Thanks,



On 19/12/12 13:58, Thomas Petazzoni wrote:
> Dear Arnaud R?billout,
>
> On Wed, 19 Dec 2012 13:47:11 +0100, Arnaud R?billout wrote:
>
>> I need to use mkenvimage. And it seems that the easiest way is to
>> automatically install it in the HOST_UBOOT_TOOLS_INSTALL_CMDS target.
>> The tool mkenvimage appeared v2011.12 of uboot, so it's present in all
>> the versions that buildroot supports.
>> The patch is a simple line, if anyone is interested.
> Indeed, mkenvimage is useful.
>
> However:
>
>   *) Could you send a proper git patch, with a description,
>   Signed-off-by line, and sent using git send-email so that it doesn't
>   get line-wrapped by your mail client.
>
>   *) I would like to see an option being added in the U-Boot
>   configuration options to pass a txt file containing an environment
>   definition, which would be passed through mkenvimage to generate an
>   image environment, and then installed in $(BINARIES_DIR). Could you
>   cook such a patch, or do you prefer if someone else does it?
>
> Thanks,
>
> Thomas


-- 
Arnaud R?billout
SYSCOM Instruments SA
rue de l'industrie 21
CH-1450 Sainte-Croix
Switzerland
Tel: +41 (0)24 455 44 11
