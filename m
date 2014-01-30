From: Danny Gale <Daniel.Gale@coloradoengineeringinc.com>
Date: Thu, 30 Jan 2014 11:11:39 -0700
Subject: [Buildroot] powerpc64 support
Message-ID: <52EA95DB.70504@coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

We have used buildroot in the past to build filesystems for 32-bit 
powerpc's with great success. Our newest boards are using 64-bit 
powerpc's, however. Using menuconfig with buildroot 2013-11, I don't see 
a target architecture for powerpc64. Is there support for 64-bit powerpc's?

We're using an externally-generated toolchain, which is compiled for 
64-bit powerpc's, specifically the e6500 core 
(powerpc64-e6500-linux-gnu-). Will selecting powerpc but using this 
64-bit toolchain generate 64-bit filesystems? I don't see the e6500 
listed as a supported Target Architecture Variant either, but I believe 
it can run 32-bit code generated for the e500 cores.

Thanks for your help,
Danny
