From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 11 Mar 2011 10:38:38 -0800
Subject: [Buildroot] SingleStep Linux Kernel with BDI200
Message-ID: <AANLkTin67wa+HwN6CGKR9LP6YOuArDn8FW=gwgUMGD+K@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have done this before although it has been a few years. Right now, I am
starting with this pdf file found by googling "single step linux kernel with
bdi2000":

www.recipes4*linux*.com/.../*bdi2000*/*kernel*
debug/Tool%20Talk%2002-001a-Debug-*Linux*%20*Kernel*.pdf<buildroot@busybox.net>

My issue is the gdb cross for powerpc. It looks like we dont build gdb for
powerpc with buildroot. At least, I dont see a gdb in
output/staging/usr/bin/ along side powerpc-unknown-linux-uclibc-gcc.

Can someone help me figure out how to create a cross gdb so I can get to the
next step, please?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110311/0fea0bfa/attachment.html>
