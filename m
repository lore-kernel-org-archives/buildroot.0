From: Ricardo Herrero <ricardo.herrero@gmail.com>
Date: Tue, 30 May 2017 23:35:35 +0200
Subject: [Buildroot] Makefile: add check of binaries architecture
Message-ID: <CABLXdK_3=64R13wD+_WN7DceLiLtwEy2Hg8Rtqdd_p6Xu4tXEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 I have been compiling some packages both ARM and linux-x86_64 archs
together until I have tested with Buildroot 2017.05_rc2. It adds a check
for proper binaries during build stage. But I need to build both archs. So
I need to know if there is a way to bypass this check or if I can do
something else. My problem is that I need a package to compile both x86_64
and arm in order to compile another package  both in x86_64. So I cannot
remove x86_64 folders right after build, I need all of them until install
phase. I have seen this, but I don?t know how to avoid
GLOBAL_INSTRUMENTATION_HOOKS (http://patchwork.ozlabs.org/patch/737884/)

Thanks for your help.
Ricardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170530/8910616b/attachment.html>
