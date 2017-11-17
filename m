From: Stephen Polkowski <stephen@centtech.com>
Date: Thu, 16 Nov 2017 19:34:19 -0600
Subject: [Buildroot] How to configure the kernel with allnoconfig and my own
 customizations
Message-ID: <5A0E3C9B.5000100@centtech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

     Does anyone know how to setup buildroot to automatically configure 
the kernel with allnoconfig and then apply my own customizations?  For 
example:

cd output/build/linux-4.11.3

make KCONFIG_ALLCONFIG=custom.config allnoconfig


Thanks,

Stephen
