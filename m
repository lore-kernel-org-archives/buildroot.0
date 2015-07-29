From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 10:14:18 +0200
Subject: [Buildroot] autobuilder toolchain updates
Message-ID: <20150729101418.0958a26a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just pushed an update of several pre-built Buildroot toolchains
used in the autobuilders:

     * br-aarch64-glibc.config
    
       Only rebuilt because uses a custom binutils version, and the
       binutils options have been renamed.
    
     * br-arcle-hs38.config
    
       Rebuilt to use the latest ARC toolchain updates.
    
     * br-arm-cortex-a9-glibc.config
    
       Rebuilt to use binutils 2.25.1.
    
     * br-arm-cortex-a9-musl.config
    
       Only rebuilt because uses a custom binutils version, and the
       binutils options have been renamed.
    
     * br-arm-full.config
    
       Rebuilt to use 3.10 kernel headers instead of the latest, so that
       we have one toolchain with reasonably ancient/recent kernel
       headers.
    
     * br-mips64-n64-glibc.config
    
       Only rebuilt because uses a custom binutils version, and the
       binutils options have been renamed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
