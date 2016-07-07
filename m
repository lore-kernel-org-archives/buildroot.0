From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 21:53:36 +0200
Subject: [Buildroot] Pre-built Buildroot toolchains updated
Message-ID: <20160707215336.0d1952d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have just updated the pre-built Buildroot toolchains used on the
autobuilders, with the following changes:

     - All toolchain have been rebuilt with Buildroot as of commit
       de4b45d5e70dd5d2431b0f44aeda60b033ecff11.
    
     - The br-arm-cortex-a9-glibc configuration now uses gcc 6.x instead of
       gcc 5.x
    
     - Many toolchains now use 4.6 kernel headers instead of 4.5 (i.e only
       the toolchains that use the "latest" kernel headers, other toolchains
       continue to use older kernel headers)
    
     - br-microblazeel-full is now using uClibc instead of glibc.
    
     - br-bfin-full has been added, it's a pre-built Blackfin toolchain
       built with Buildroot (gcc 6.x, binutils 2.26 and uClibc-ng)

The addition of two gcc 6.x based toolchains will certainly trigger a
good amount of new build failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
