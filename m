From: ravi chandran <ravigct27@gmail.com>
Date: Thu, 26 Jul 2018 22:13:10 +0530
Subject: [Buildroot] using LINUX_DIR variable in BR
Message-ID: <CAAMHf5Eu6H49vRDgR1_XikvK8fBo=_hVYPd2hU3QytkgO4_x5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
     I am trying to include the path of the linux kernel(source located in
output/build/linux) in one of the makefile which is located outside the
linux directory.

KERNEL_DIR := $(LINUX_DIR).

But when i try to refer the  KERNEL_DIR , it is empty.

Am i missing something here, can some one please help?

I used LINUX_DIR variable as it is mentioned in the BR doc

You may also reference (but you may *not* set!) those variables:

   - LINUX_DIR contains the path to where the Linux kernel has been
   extracted and built.
   - LINUX_VERSION contains the version string as configured by the user.
   - LINUX_VERSION_PROBED contains the real version string of the kernel,
   retrieved with running make -C $(LINUX_DIR) kernelrelease
   - KERNEL_ARCH contains the name of the current architecture, like arm,
   mips?

Thanks,
Ravi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180726/83e6dd89/attachment.html>
