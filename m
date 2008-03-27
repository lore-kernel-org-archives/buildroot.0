From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 27 Mar 2008 10:52:22 +0100
Subject: [Buildroot] Using a different kernel tree ?
Message-ID: <057401c88ff0$46259410$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I'd like to use, within buildroot, the kernel tree from 
git://git.xilinx.com/linux-2.6-xlnx.git instead of the vanilla tree coming 
with buildroot.

How does one do that ?

If I just replace toolchain_build_ppc/linux-2.6.24 and/or 
project_build_ppc/my_project/linux-2.6.24 with the Xilinx tree, on the next 
"make ARCH=ppc linux26-menuconfig" it just deletes the whole directory and 
rebuilds it from bzcat...

Or are there alternatives if I want to use the nice toolchain built by 
buildroot ?


BTW, what is the difference between toolchain_build_ppc/linux-2.6.24 and 
project_build_ppc/my_project/linux-2.6.24 ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
  "It's a little-known fact that the Y1K problem caused the Dark Ages." 
