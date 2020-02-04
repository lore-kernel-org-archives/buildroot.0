From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 4 Feb 2020 11:50:26 +0100
Subject: [Buildroot] [PATCH v2] package/libnspr: remove
 BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
Message-ID: <4B074CB5-6E88-4452-BF94-93911A53DA60@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?
> Il giorno 4 feb 2020, alle ore 11:04, Thomas Petazzoni <thomas.petazzoni@bootlin.com> ha scritto:
> 
> ?On Tue,  4 Feb 2020 10:50:59 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Since all architectures supported by Buildroot are supported by libnspr
>> BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT makes no sense anymore, so let's remove
>> it all around.
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Arnout and I both agreed that we want to keep this blind option, so I'm
> not sure I understand why you're sending this patch. Did we miss something?

Oh gosh, I?ve read the contrary at first sight.
Please ignore this patch and sorry for the noise, too few coffee :-)

Kind regards
Giulio Benetti

> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
