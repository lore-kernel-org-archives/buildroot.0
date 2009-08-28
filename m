From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Aug 2009 16:49:51 +0200
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com> (Bill
	Bogstad's message of "Thu\, 27 Aug 2009 17\:29\:52 -0400")
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
Message-ID: <87fxbcro1c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bill" == Bill Bogstad <bogstad@pobox.com> writes:

Hi,

 Bill> When I try to use buildroot to to generate a minimal init ramdisk for
 Bill> i386, I get the following error if I try include the kexec package:

 Bill> ......
 Bill> bin/bin-to-hex purgatory < purgatory/purgatory.ro > kexec/purgatory.c
 Bill> /bin/sh: bin/bin-to-hex: not found
 Bill> make[1]: *** [kexec/purgatory.c] Error 127
 Bill> make[1]: Leaving directory
 Bill> `/home/bogstad/software/buildroot/buildroot-2009.05/build_i386/kexec-2.0.0'
 Bill> make: *** [/home/bogstad/software/buildroot/buildroot-2009.05/build_i386/kexec-2.0.0/.stamp_built]
 Bill> Error

 Bill> Does kexec build for any architecture in 2009.05?  Any suggestions on
 Bill> making this work for i386?

It builds here without any problems. Have you set BR2_JLEVEL to
something else than 1? Could you please post your .config?

-- 
Bye, Peter Korsgaard
