From: Vasanth Ragavendran <ragavendra.2007@gmail.com>
Date: Mon, 5 Nov 2012 20:41:53 +0800
Subject: [Buildroot] Build root local site method
Message-ID: <CADfuMF4YnAPm_m6YbjO0oCYPJKxqgGwX9amz7SOXhRB3x3mewg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

This is with reference to the download method which is specified while
compiling a new package. I'm writing certain programs which needs to be
cross compiled and run in my embedded board. In my <pkg>.mk file I'm
specifying the 'site' to the directory containing my source code and the
'site_method' to "local". I've made necessary changes to the Config.in
files in all locations. I am able to select this package of mine from the
menuconfig, however the package refuses to build for some unknown reason
neither does the build print any errors. It just quietly skips compiling
this package and finishes generating the file system. And the location
which I'm pointing to in the mk file contains the necessary source code.
I'm wondering what step I've skipped. Attaching the Config.in and <pkg>.mk
file which I've created for my package. Kindly help as I'm struck in this
and unable to proceed. I've referred to the manual but unable to solve this
issue.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121105/bd1e2407/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in
Type: application/octet-stream
Size: 235 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121105/bd1e2407/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ftpclient.mk
Type: application/octet-stream
Size: 625 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121105/bd1e2407/attachment-0001.obj>
