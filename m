From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Tue, 9 Jan 2007 19:39:29 -0800 (PST)
Subject: [Buildroot] buildroot compile error - "Rn must not overlap other
	operands"
Message-ID: <2179.63.193.249.101.1168400369.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    I downloaded the latest 17177 version of buildroot and got
the following compile error (shown in the enclosed make_1.log):

../xgcc .... buildroot/toolchain_build_arm/gcc-3.4.2/boehm-gc/finalize.c
/tmp/ccVyKzUN.s: Assembler messages:
/tmp/ccVyKzUN.s: Error: Rn must not overlap other operands -- `swp r3,5,[r3]'

1.  Has anyone seen this before?  I googled it and it appears to be
    a real ARM bug. Does anyone know how to find where the swp
    assembly source that is causing the error is?

2.  Does anyone know how to stop the /tmp/ccVyKzUN.s file from being
    removed so that I can look at it?


Enclosed are:

a.  make.log - make log file
b.  config     - .config file

Please let me know if any other information would be useful.
Thanks in advance,

Nina
-------------- next part --------------
A non-text attachment was scrubbed...
Name: make.log
Type: application/octet-stream
Size: 3370 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070109/09d8c265/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 10238 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070109/09d8c265/attachment-0001.obj 
