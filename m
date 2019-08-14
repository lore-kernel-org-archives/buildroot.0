From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Wed, 14 Aug 2019 11:05:35 +0300
Subject: [Buildroot] Buildroot - Xenomai - error
Message-ID: <CAPm8-H77ttqUDcp9YOvJwOZwoTBHo_mRL_weV4GoNCqdXQ429Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot community,

  I try to build a Xenomai 3.0.9 Linux 4.14.71-x86_64 system for qemu
using buildroot
and I am facing the below error. Is there any way to tell buildroot
to apply the patch anyway or convert this error into a warning?
Do you have any ideas how to overcome this error?
I mention that I have successfully built Xenomai 3.0.5 Linux
4.9.38-x86_64 for qemu using buildroot.

>>> xenomai 3.0.9 Patching

Applying 0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch
using patch:
Error: duplicate filename
'0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch'
Conflicting files are:
  already applied:
/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.02.kiszka/package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch
  to be applied  :
/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.02.kiszka/package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch
package/pkg-generic.mk:202: recipe for target
'/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.02.kiszka/output/build/xenomai-3.0.9/.stamp_patched'
failed
make: *** [/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.02.kiszka/output/build/xenomai-3.0.9/.stamp_patched]
Error 1

Thank you and kind regards,
L-C. Duca
