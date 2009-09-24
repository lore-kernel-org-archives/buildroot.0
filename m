From: Ormund Williams <ormundw@panix.com>
Date: Thu, 24 Sep 2009 02:12:15 -0400
Subject: [Buildroot] mpfr-2.4.1.patch not found
Message-ID: <1253772735.451.111.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm getting this error on a clean build:

bzcat ./../dl/mpfr-2.4.1.tar.bz2 | tar -C .../buildroot/output/toolchain  -xf -
toolchain/patch-kernel.sh .../buildroot/output/toolchain/mpfr-2.4.1 package/mpfr/ \*.patch
cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess .../buildroot/output/toolchain/mpfr-2.4.1
( cd .../buildroot/output/toolchain/mpfr-2.4.1; patch -p1 -N -Z < ./../dl/mpfr-2.4.1.patch; )
/bin/sh: ./../dl/mpfr-2.4.1.patch: No such file or directory
make: *** [.../buildroot/output/toolchain/mpfr-2.4.1/.unpacked] Error 1

Where is this patch suppose to come from?
-- 
Ormund Williams
OrmLab LLC
