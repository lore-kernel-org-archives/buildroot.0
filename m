From: Ram kumar <ramkumar.research@gmail.com>
Date: Thu, 29 May 2008 02:39:28 +0530
Subject: [Buildroot] undefined macro: AM_PROG_LIBTOOL (buildroot failure)
Message-ID: <6306c640805281409v1bf5384ag2c1353fd4aead298@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
     Iam trying to build a development environment using buildroot for my
atmel eval kit (AT91SAM9260 ek).I follow the instruaction in the website
http://www.linux4sam.org/twiki/bin/view/Linux4SAM/BuildRoot. But my
buildroot fails when it is trying to build libusb.

First the buildroot throws 404 file not found error since
http://ftp.debian.org/pool/main/libu/libusb/ doesn't have
libusb_0.1.12-9.diff.gz which buildroot looks for......so i edited the
/buildroot/package/libusb/libusb.mk file to download
libusb_0.1.12-11.diff.gz which is present in the FTP server.

Build root then succeeds and stops with the following error message.

configure.in:84: warning: macro `AM_PROG_LIBTOOL' not found in library
autoreconf: configure.in: tracing
autoreconf: configure.in: not using Libtool
autoreconf: running: /buildroot/build_arm/staging_dir/usr/bin/autoconf
--include=/buildroot/build_arm/staging_dir/usr/share/aclocal --force
configure.in:84: error: possibly undefined macro: AM_PROG_LIBTOOL
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
autoreconf: /buildroot/build_arm/staging_dir/usr/bin/autoconf failed with
exit status: 1

Please guide me whether i have to apply any patch to overcome this error ?

I have tried buiding buildroot for several times.But i didn't succeed even
for a single time.Most of the time i get the file not found error or some
unknown error.

Is this because iam compiling a recent version or a beta version or an
unstable version?

Please guide me which version of buildroot will compile properly  ? so that
i can download that and build a development environment for my research.

Regards,
Ram
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080529/46cfde58/attachment.htm 
