From: Ravi <phulsundar_ravi@rediffmail.com>
Date: 7 Oct 2009 18:54:01 -0000
Subject: [Buildroot] =?utf-8?q?Qtopia?=
Message-ID: <20091007185401.38976.qmail@f6mail-144-154.rediffmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All, 

I'm trying to use buildroot for my project where I need GUI interface. 

I decided to use qtopia. 

But while compiling, it shows following errors 

bash: ./build_i386/qt-embedded-linux-opensource-src-4.4.3/bin/qmake: No such file or directory 

But the file exist at same location. 

when I run following command 
$file qmake: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped 

That means qmake cannnot run on my machine, It is compiled for my target instead of my machine. 

What should I do please help me 

Ravi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091007/954b426d/attachment.htm>
