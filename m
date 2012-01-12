From: Johannes Teiwes <jteiwes@informatik.uni-bremen.de>
Date: Thu, 12 Jan 2012 09:47:13 +0100
Subject: [Buildroot] including python when compiling for microblaze
Message-ID: <2AB0B5A7-70EA-4CDB-8B28-A07F81E83394@informatik.uni-bremen.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am currently trying to port the python package in buidroot to the microblaze platform.
I have everything set up with a custom toolchain etc. and it works fine. The problem is
the libffi library, which is required for building any script language (e.g. perl, python)
for buildroot. The exact error message says

configure: error: "libffi has not been ported to microblaze-unknown-linux-gnu."

Has anyone started to port libffi to another platform or even found a specific workaround
for microblaze? Is there any alternative to the libffi library or installing python via buildroot?

Any help is greatly appreciated.
--
Johannes Teiwes - jteiwes at tzi.de




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120112/0c11dae3/attachment.html>
