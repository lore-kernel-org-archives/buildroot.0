From: Xuefeng Ren <renxfmaillist@gmail.com>
Date: Thu, 29 Mar 2007 21:39:10 +0800
Subject: [Buildroot] How to build file without pic enabled
Message-ID: <7f24b70f0703290639s158e8533w60086bac5fcf4bb3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I build my app with buildroot with elf2flt enabled.
sometimes the app was built with the format BFLT excuable - version 4 gotpic
sometimes the app was build with the format BFLT excuable - version 4 ram.
I know When build the gotpic enabled, we should add the flags -D__PIC__
-fpic -msingle-pic-base
but some times even i did not add this flags, the file is still gotpic
format.
How to disable the pic feature. because i want build my app with BFLT
excuable - version 4 ram.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070329/de570ffe/attachment.htm 
