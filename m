From: sm_here <sayantan.majumder@gmail.com>
Date: Wed, 17 Feb 2010 23:28:52 -0800 (PST)
Subject: [Buildroot]  Unable to build kernel & FS image using buildroot
Message-ID: <27635129.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am using qemu 0.12.2. I am trying to build the kernel and file system image
using buildroot. After configuring buildroot, when I try to build the kernel
and file system image, i am getting the error:
"In function '__do_global_dtors_aux':
'__DTOR_LIST__' undeclared (first use in this function)"

I have set the following configuration options for buildroot:
# Target Architecture option -- arm
# Target Architecture Variant option --arm926t
# Target options menu -- "ARM Ltd. Device Support" is enabled, and inside it
"Integrator arm926" option is chosen
# Toolchain menu -- "Build gdb server for the Target" option, has been
chosen
# Target filesystem options menu -- "cpio the root filesystem" option is
chosen, and the "gzip" compression method is chosen
# Kernel menu -- "linux (Advanced configuration)" option is chosen, and
Linux kernel version 2.6.31 is chosen. Also,the "zImage" binary format has
been selected.
Also the gcc version used id 4.3.4.

Do i need to configure differently?
-- 
View this message in context: http://old.nabble.com/Unable-to-build-kernel---FS-image-using-buildroot-tp27635129p27635129.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
