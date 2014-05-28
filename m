From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 09:51:00 +0200
Subject: [Buildroot] how to enable -mfloat-abi=hard in cross toolchain
 for ARM1136
In-Reply-To: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
References: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
Message-ID: <20140528095100.719c69ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Wed, 28 May 2014 16:09:02 +0900, Rohit Kumar wrote:

> i created toolchain using buildroot for ARM1136
> attached is the configuration file.
> i want to cross compile the program with "-mfloat-abi=hard" option, i
> get following error
> 
> /home/rohit/Desktop/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs.h:10:29:
> fatal error: gnu/stubs-hard.h: No such file or directory
> compilation terminated.
> 
> how to enable above in buildroot configuration?

Use EABIhf instead of EABI in the Buildroot configuration, under
"Target options".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
