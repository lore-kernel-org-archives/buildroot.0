From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jul 2010 11:38:38 +0200
Subject: [Buildroot] Build failed with Error 1 and Error 2
In-Reply-To: <29222695.post@talk.nabble.com>
References: <29222293.post@talk.nabble.com> <20100721085235.7f682c11@surf>
	<29222695.post@talk.nabble.com>
Message-ID: <20100721113838.271898f7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jul 2010 00:32:51 -0700 (PDT)
JNY <jny0@hotmail.com> wrote:

> BR2_VERSION="2010.02"

Would it be possible to use the latest Buildroot stable version, i.e
2010.05 ?

> BR2_KERNEL_HEADERS_2_6_32=y
> # BR2_KERNEL_HEADERS_VERSION is not set
> # BR2_KERNEL_HEADERS_SNAP is not set
> BR2_DEFAULT_KERNEL_HEADERS="2.6.32.9"

In 2010.02, we have the patch for the kernel headers to fix the issue
you are seeing.

I tested your .config with 2010.02 and it builds just fine.

Could you please send use the full build log, by doing something like:

 rm -rf output/
 make 2>&1 | tee build.log

And put the resulting build.log online somewhere ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
