From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 16:10:05 +0100
Subject: [Buildroot] help
In-Reply-To: <33966b5d0903230724l7508be23m9e114af609f41cb6@mail.gmail.com>
	(mzee mzee's message of "Mon\, 23 Mar 2009 14\:24\:50 +0000")
References: <33966b5d0903230724l7508be23m9e114af609f41cb6@mail.gmail.com>
Message-ID: <87iqm0l1gy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "mzee" == mzee mzee <wanyumba@gmail.com> writes:

 mzee> #
 mzee> hi,i need helpthis is my problem

 mzee> ??? ??? /usr/bin/make -j1 CROSS_COMPILE="/home/thuoeg/builroot/buildrootsnap/
 mzee> build_i686/staging_dir/usr/bin/i686-linux-uclibc-" ARCH=i386 \
 mzee> ??? ??? ?-C /home/thuoeg/builroot/buildrootsnap/project_build_i686/mzee/
 mzee> u-boot-2009.01

U-Boot for i686?

 mzee> /home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/usr/bin/
 mzee> i686-linux-uclibc-gcc -g? -Os?? -fPIC -ffixed-r14 -meabi -fno-strict-aliasing
 mzee> -D__KERNEL__ -DTEXT_BASE=0xFFFC0000 -I/home/thuoeg/builroot/buildrootsnap/
 mzee> project_build_i686/mzee/u-boot-2009.01/include -fno-builtin -ffreestanding
 mzee> -nostdinc -isystem /home/thuoeg/builroot/buildrootsnap/build_i686/staging_dir/
 mzee> usr/bin-ccache/../lib/gcc/i686-linux-uclibc/4.3.3/include -pipe? -DCONFIG_I386
 mzee> -D__I386__ -DCONFIG_4xx -ffixed-r2 -mstring -msoft-float -Wa,-m405 -mcpu=405

U-Boot seems to think you have ppc405 instead. Did you try a ppc
compile before? Can you build u-boot by hand with the buildroot cross
compiler? Where is your .config?

-- 
Bye, Peter Korsgaard
