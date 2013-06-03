From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 03 Jun 2013 19:13:44 +0100
Subject: [Buildroot] Why does boost require bzip2
Message-ID: <51ACDCD8.5080806@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Does anyone know why the boost package requires bzip2? I am wanting to 
build a very small rootfs and require only a single boost library, I 
want to avoid the overhead of having the bzip2 library in my target fs.

If I change the boost package it still manages to build all the 
libraries so I can't work out which libraries need bzip2. (I also have a 
build failure when trying to build the boost context library, it is 
failing because my arm target doesn't support the assembler, I'll look 
into that error separately).

Thanks
Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
