From: Francisco =?iso-8859-1?q?P=E9rez_Botella?= <xerox@eivissaweb.net>
Date: Mon, 19 Mar 2007 21:41:06 +0100
Subject: [Buildroot] Cannot compile kernel with toolchain
Message-ID: <200703192141.07227.xerox@eivissaweb.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello:

this is my first try to buildroot.
I could commplete compilation of buildroot with 2.6.8 kernel headers, I'm 
using toolchain to build images for bcm96438 mips board.
I'm not using root filesystem.

I can compile programs I could not do before with toolchain provided with the 
gpl source firmware... rint() problems on iproute and if_ifnametoindex etc..

The problem is I could not compile the kernel anymore, when  Itry quickly 
returns me a error in scall-o32.S telling me that the macro sys is already 
definned, I think it can be some of duplication of header files, I do not 
know very much about it, is just a guess.

Do you know how to correct this

thanks

-- 
Francisco J. P?rez Botella
