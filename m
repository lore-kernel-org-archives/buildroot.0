From: Rishi <rishid+mailman@gmail.com>
Date: Tue, 20 Sep 2011 11:16:27 -0400
Subject: [Buildroot] Building hangs on a RHEL 6 machine
In-Reply-To: <CAJbs9BHXcxhVOCoSKFykn1TEXw=DeJCRPExkNy94h-DPOUVm+g@mail.gmail.com>
References: <CAJbs9BHXcxhVOCoSKFykn1TEXw=DeJCRPExkNy94h-DPOUVm+g@mail.gmail.com>
Message-ID: <CAJbs9BHpm3Tm-0eEA1gH-qqZf1WSnt7ny=tDuPOROocBGFLMgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version of buildroot: Buildroot 2011.11-git-00107-gdcb43a0

I am trying to build a uclibc toolchain on a Redhat 6 machine and it hangs.
 The last lines printed have been reproduced below:

The config file I am using has been attached, I built the exact same config
file just fine on a Ubuntu 10.04 machine but my work uses Redhat and need to
be able to build it there.  The pertinent options are: Buildroot toolchain,
Kernel headers, 2.6.36.x, uClibc v0.9.32.x and default config file.

Any thoughts?

Thanks.

[buildroot]$ make
/usr/bin/make -j2 -C
/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial all-gcc
 make[1]: Entering directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial'
Configuring in ./libiberty
make[2]: Entering directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/intl'
make[2]: Entering directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/build-i686-pc-linux-gnu/libiberty'
make[3]: Entering directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/build-i686-pc-linux-gnu/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/build-i686-pc-linux-gnu/libiberty/testsuite'
make[2]: Leaving directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/build-i686-pc-linux-gnu/libiberty'
make[2]: Entering directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/libdecnumber'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/libdecnumber'
make[2]: Entering directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/build-i686-pc-linux-gnu/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/user/buildroot/buildroot/output/toolchain/gcc-4.4.6-initial/build-i686-pc-linux-gnu/fixincludes'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110920/2b825d9e/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 20122 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110920/2b825d9e/attachment-0001.obj>
