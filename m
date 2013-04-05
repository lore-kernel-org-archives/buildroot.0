From: Ormund Williams <ormundw@panix.com>
Date: Fri, 05 Apr 2013 16:06:06 -0400
Subject: [Buildroot] Trying to configure the kernel
Message-ID: <1365192366.30488.205.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I downloaded the latest stable release, 2013.02, then ran 'make
menuconfig' then 'make' and it built without errors, then I wanted to
build the kernel so did 'make menuconfig' again and turned on the kernel
but neither of the choices 'defconfig' or 'custom config file' works
when I try to run 'make linux-menuconfig' I get one of the 2 errors
bellow:
  linux/linux.mk:321: *** No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting.  Stop.
or
  linux/linux.mk:327: *** No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting.  Stop.

I feel like I've missed a step. Have I?

-- 
Ormund
