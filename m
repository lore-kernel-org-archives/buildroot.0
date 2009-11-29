From: Nikos <microvis@cox.net>
Date: Sun, 29 Nov 2009 13:09:58 -0800
Subject: [Buildroot] buildroot-2009.08 on Ubuntu 9.04 compiler internal
 failures+other errors
Message-ID: <1259528998.4690.31.camel@PentHT>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

Trying to build ARM Cortex8 on Ubuntu 9.04 starting
from /configs/arm_toolchain_defconfig to which I've added few options. 
Trying repeatedly compilation either fails or gives compiler internal
error. Compiler is gcc-4.4.2. In addition "distclean" and "clean"
targets locks up file system so badly, that reboot+manual fsck is
required to clean up the mess. 
Each attempt preformed started with fresh download on clean up
environment. Download was preformed using git. 

Are there any known issues on Ubuntu? Are there any known causes on
compiler faulting on what appears to be routine? I hope I'm missing only
something simple here...

Thanks
Nikos
