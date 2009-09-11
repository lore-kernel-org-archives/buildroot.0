From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Fri, 11 Sep 2009 08:48:25 +0200
Subject: [Buildroot] External Toolchain in latest stable buildroot
Message-ID: <330EC2471BF24E48B513AF1A6975EB69AD87F9@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 

I'm trying to use external toolchain in latest stable buildroot version
(2009.08). It seems that the setup has changed some from the earlier
version I was using (0.10.0svn or something like that).

 

Now when I configure external toolchain in use and execute make -
command I get result 'Incorret selection of the C library'. Toolchain is
EABI and uses glibc. I have tried both uClibc and glibc - settings from
the buildroot setup, but still get the same error.  (Of course that's
valid for uClibc). 

 

With older buildroot there were no such problems and I was able to start
using external toolchain with little troubles. (Although later on I ran
in to some other problems and that's why I upgraded the buildroot).

 

All the documents I found are meant for older versions of buildroot and
use a little different configuration so they are not much help.

 

Is there something I should know/do more to get the external toolchain
to work in latest stable buildroot?

 

Teemu Keskinarkaus

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090911/af063199/attachment-0001.htm>
