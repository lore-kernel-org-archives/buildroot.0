From: jing han <jing_han_66@yahoo.com>
Date: Thu, 2 Jul 2009 06:40:15 -0700 (PDT)
Subject: [Buildroot] MSB vs LSB mips library files
Message-ID: <147166.24870.qm@web53506.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I downloaded buildroot-2009.05.tar.gz and built a mips32r2, o32 environment in my machine  (fedora core 5   2.6.15-1.2054_FC5).

After the make is finished, I checked through the mips files in my mips environment, I found that all the files in buildroot-2009.05/build_mips/staging_dir/usr/bin/* directory are LSB files, all the library files in buildroot-2009.05/build_mips/staging_dir/usr/lib/* directory are MSB files, which 
supprise me a lot and I don't want. 

I compiled a simple program with mips-linux-gcc which only print "Hello World", the result of "file a.out" is as follows:

a.out: ELF 32-bit MSB executable, MIPS, MIPS64 version 1 (SYSV), dynamically linked (uses shared libs), not stripped

I don't want MSB executables, I  want LSB executables.  Can you tell me  why  I  have  MSB mips library files? What can I do in order to have LSB mips library files and to make my mips executables LSB files?

Could you tell me which option I could choose in order to avoid MSB library files?

Thank you in advance and I'm looking forward to hearing from you soon.

Best Regards
jing


      __________________________________________________________________
Looking for the perfect gift? Give the gift of Flickr! 

http://www.flickr.com/gift/
