From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 10:43:08 +0100
Subject: [Buildroot] Pre-built Buildroot toolchains updated
Message-ID: <20170305104308.2650e30b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have deployed a new set of Buildroot toolchains, not all of them, but
a few ones that needed to be rebuilt:

     - br-arcle-hs38
    
       Rebuilt to benefit from the
       895-arc-define-_REENTRANT-when-pthread-is-passed.patch patch, to have
       _REENTRANT defined.
    
     - br-arm-cortex-a9-glibc
    
       Built with the new glibc 2.25
    
     - br-aarch64-glibc
       br-mips32r6-el-hf-glibc
       br-mips64r6-el-hf-glibc
       br-nios2-glibc
       br-powerpc64-power7-glibc
       br-powerpc64le-power8-glibc
       br-sparc64-glibc
    
       Rebuilt with glibc 2.24, the new default glibc version

The new toolchain based on glibc 2.25 might cause some build issues, as
it's the first toolchain that uses this glibc version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
