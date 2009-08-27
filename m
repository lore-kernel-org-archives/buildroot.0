From: Bill Bogstad <bogstad@pobox.com>
Date: Thu, 27 Aug 2009 17:29:52 -0400
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
Message-ID: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I try to use buildroot to to generate a minimal init ramdisk for
i386, I get the following error if I try include the kexec package:

......
bin/bin-to-hex purgatory < purgatory/purgatory.ro > kexec/purgatory.c
/bin/sh: bin/bin-to-hex: not found
make[1]: *** [kexec/purgatory.c] Error 127
make[1]: Leaving directory
`/home/bogstad/software/buildroot/buildroot-2009.05/build_i386/kexec-2.0.0'
make: *** [/home/bogstad/software/buildroot/buildroot-2009.05/build_i386/kexec-2.0.0/.stamp_built]
Error

Does kexec build for any architecture in 2009.05?  Any suggestions on
making this work for i386?

Thanks,
Bill Bogstad
