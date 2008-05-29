From: Ram kumar <ramkumar.research@gmail.com>
Date: Thu, 29 May 2008 23:49:00 +0530
Subject: [Buildroot] libusb error undefined macro: AM_PROG_LIBTOOL
Message-ID: <6306c640805291119s1fffe9e1ye2fccab7dff1b264@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
     First the buildroot throws 404 file not found error since
http://ftp.debian.org/pool/main/libu/libusb/ doesn't have
libusb_0.1.12-9.diff.gz which buildroot looks for......so i edited the
/buildroot/package/libusb/libusb.mk file to download
libusb_0.1.12-11.diff.gz which is present in the FTP server.

Build root then succeeds and stops with the following error message.when it
is trying to apply the patch to the libusb.

It mainly fails after applying the patch to the libusb.

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
i can use it my target!!!!!

Regards,
Ram
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080529/162245c7/attachment-0001.htm 
