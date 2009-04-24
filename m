From: Mike Tinnes <mike_tinnes@hotmail.com>
Date: Fri, 24 Apr 2009 14:59:18 -0500
Subject: [Buildroot] Qt compiler flags
Message-ID: <BAY105-W31F28B116E99DD4097DB1991720@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 

I'm building a Mipsel32 toolchain with Qt enabled and ran into an issue when compiling the Qt libs.  I got the following error repeated:

 

Error: opcode not supported on this processor: mips1 (mips1) `ll $8,0($4)'

 

I was able to correct this by adding -mips32 to the CXX_FLAGS in the makefiles of the failing subprojects. C_FLAGS has -mips32, CXX_FLAGS does not.

 

I'm wondering if this is an issue with the buildroot or the Qt configure?

Thanks, Mike


 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090424/c8ae2edd/attachment-0001.htm>
