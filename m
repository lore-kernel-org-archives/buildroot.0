From: Michael Dick <mi-dick@gmx.de>
Date: Sun, 25 Mar 2018 12:36:54 +0200
Subject: [Buildroot] Make C and CXX compiler cache in toolchainfile.cmake.in
Message-ID: <000001d3c425$31ba3fc0$952ebf40$@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using buildroot to create my custom gcc toolchain and sysroot for a
raspberry pi. 

 

Therefore, I call cmake with a script to configure my project. After that, I
import the project into qtcreator.

The problem is, that C and CXX compiler variables are not cached into cmake
cache, so when importing the project, qtcreator calling cmake is not aware
oft he configured compiler.

 

My suggestion ist o use this patch. Is there any reason why the compilers
are not cached?

 

 

Best regards

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180325/9f6edfa3/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: toolchainfile.patch
Type: application/octet-stream
Size: 800 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180325/9f6edfa3/attachment.obj>
