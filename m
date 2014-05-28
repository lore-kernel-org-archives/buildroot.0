From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 11:20:27 +0200
Subject: [Buildroot] how to enable -mfloat-abi=hard in cross toolchain
 for ARM1136
In-Reply-To: <CABzetm3Lo_iRMEXa8p3N4_F6nODNPan2=4PzXuff1_eardyTtQ@mail.gmail.com>
References: <CABzetm3LyoP3JCsvMZOO1fbQBuaSLbahJJU81gSzLB2yeG_+Uw@mail.gmail.com>
 <20140528095100.719c69ac@free-electrons.com>
 <CABzetm3NU_ZZrpU0+uw+iA8f2gcTRqVEVNP7023Vho=G4RFE7Q@mail.gmail.com>
 <20140528105311.43b2c178@free-electrons.com>
 <CABzetm3Lo_iRMEXa8p3N4_F6nODNPan2=4PzXuff1_eardyTtQ@mail.gmail.com>
Message-ID: <20140528112027.6733e798@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Wed, 28 May 2014 18:05:07 +0900, Rohit Kumar wrote:

> Yes,
> i did "make clean; make"

Here, the below defconfig builds fine:

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_ARM_EABIHF=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

I'll restart the build with BR2_arm1136jf_s_r0=y, which is the CPU core
you selected.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
