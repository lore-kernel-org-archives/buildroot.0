From: sm_here <sayantan.majumder@gmail.com>
Date: Fri, 19 Feb 2010 04:17:05 -0800 (PST)
Subject: [Buildroot]  issue with buildroot
Message-ID: <27652571.post@talk.nabble.com>
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

What changes do i need to make to the configuration?
-- 
View this message in context: http://old.nabble.com/issue-with-buildroot-tp27652571p27652571.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
