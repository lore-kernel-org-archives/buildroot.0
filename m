From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 10:53:11 +0200
Subject: [Buildroot] how to enable -mfloat-abi=hard in cross toolchain
 for ARM1136
In-Reply-To: <CABzetm3NU_ZZrpU0+uw+iA8f2gcTRqVEVNP7023Vho=G4RFE7Q@mail.gmail.com>
References: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
 <20140528095100.719c69ac@free-electrons.com>
 <CABzetm3NU_ZZrpU0+uw+iA8f2gcTRqVEVNP7023Vho=G4RFE7Q@mail.gmail.com>
Message-ID: <20140528105311.43b2c178@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Wed, 28 May 2014 17:32:25 +0900, Rohit Kumar wrote:

> enabling it leads to errors in compiling
> 
> 
> checking for .previous assembler directive... yes
> checking for .protected and .hidden assembler directive... yes
> checking whether __attribute__((visibility())) is supported... yes
> checking for broken __attribute__((visibility()))... no
> checking for broken __attribute__((alias()))... no
> checking whether to put _rtld_local into .sdata section... no
> checking for .preinit_array/.init_array/.fini_array support... no
> configure: error: Need linker with .init_array/.fini_array support.
> make: ***
> [/home/rohit/Desktop/buildroot/output/build/glibc-2.18/.stamp_configured]
> Error 1

Did you do a complete "make clean; make" cycle?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
