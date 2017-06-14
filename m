From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 14 Jun 2017 09:14:46 +0200
Subject: [Buildroot] libasan.so missing
Message-ID: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using the x86_64 buildroot toolchain with gcc 5.4. I wonder why the 
address sanitizer library "libasan.so*" is not available in the rootfs 
of the target. Is it intentional? And what is the best way to get it 
added to the rootfs?

Wolfgang.
