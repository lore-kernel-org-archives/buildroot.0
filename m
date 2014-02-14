From: Peter Kuemmel <syntheticpp@gmx.net>
Date: Fri, 14 Feb 2014 17:11:42 +0100
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
In-Reply-To: <CA+kK6WvnKsgiAeb3XZZ+vM=Xp2KHPOLu9Q2BKXJ5_jMahamQpQ@mail.gmail.com>
References: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
 <CAEBucnAUUP3==KSjx_uXZpcjfk9KNwOQqhQ0Eb-hu2+J7wfcKQ@mail.gmail.com>
 <CA+kK6Ws34CaJSSsk1cjg1=OKUXpoURarO9d9sTS8CGO7dXqNtQ@mail.gmail.com>
 <trinity-1946d258-c976-4ab8-8bd0-b43588728ea6-1392371833737@3capp-gmx-bs31>
 <trinity-3b023d3c-da74-4988-b5b0-903e733840ee-1392375827799@3capp-gmx-bs16>,
 <CA+kK6WvnKsgiAeb3XZZ+vM=Xp2KHPOLu9Q2BKXJ5_jMahamQpQ@mail.gmail.com>
Message-ID: <trinity-222199c1-040e-4581-ad7d-7af19554917b-1392394302549@3capp-gmx-bs15>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Your kernel version is 3.0.50 and that could be the issue.

Indeed, seems my kernel is too old.

Thanks for the explanation.
Peter

> 
> The release notes contain this instruction:
> >Pre-requisites
> >
> >Kernel(Linux PSP) versions supported or used for validation
> >
> >Only the following devices have been tested & details below -
> >
> >AM335x & AM43x -
> >
> >Tree: git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
> >Branch: ti-linux-3.12.y
> >commit - dfea149efb32485f17bb7440eb326549c8f647e2, tag - ti2013.12.00
> >
> >NOTE-
> >1.Ensure the reset controller driver is enabled in kernel menuconfig if not enabled by default as below-
> >CONFIG_ARCH_HAS_RESET_CONTROLLER=y
> >CONFIG_RESET_CONTROLLER=y
> >CONFIG_RESET_TI=y
> 
> Regards,
> Marcelo
> 
