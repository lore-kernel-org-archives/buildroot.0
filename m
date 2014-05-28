From: Rohit Kumar <rkthebest@gmail.com>
Date: Wed, 28 May 2014 18:05:07 +0900
Subject: [Buildroot] how to enable -mfloat-abi=hard in cross toolchain
	for ARM1136
In-Reply-To: <20140528105311.43b2c178@free-electrons.com>
References: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
 <20140528095100.719c69ac@free-electrons.com>
 <CABzetm3NU_ZZrpU0+uw+iA8f2gcTRqVEVNP7023Vho=G4RFE7Q@mail.gmail.com>
 <20140528105311.43b2c178@free-electrons.com>
Message-ID: <CABzetm3Lo_iRMEXa8p3N4_F6nODNPan2=4PzXuff1_eardyTtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,


On Wed, May 28, 2014 at 5:53 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Wed, 28 May 2014 17:32:25 +0900, Rohit Kumar wrote:
>
> > enabling it leads to errors in compiling
> >
> >
> > checking for .previous assembler directive... yes
> > checking for .protected and .hidden assembler directive... yes
> > checking whether __attribute__((visibility())) is supported... yes
> > checking for broken __attribute__((visibility()))... no
> > checking for broken __attribute__((alias()))... no
> > checking whether to put _rtld_local into .sdata section... no
> > checking for .preinit_array/.init_array/.fini_array support... no
> > configure: error: Need linker with .init_array/.fini_array support.
> > make: ***
> > [/home/rohit/Desktop/buildroot/output/build/glibc-2.18/.stamp_configured]
> > Error 1
>
> Did you do a complete "make clean; make" cycle?
>

Yes,
i did "make clean; make"

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140528/360fbced/attachment.html>
