From: Richard <mr.resistor@gmail.com>
Date: Wed, 23 Jul 2008 13:39:32 +0100
Subject: [Buildroot] undefined reference to open64
Message-ID: <ea6597e70807230539k29aa1f26idf11872dd03cfeb0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hey

i am building a system with the most recent buildroot snapshot (23/07) for
an ARM9 board, which is failing if i try to build php / lighttpd / many
others. they all give the same error message, which is:

conf_to_src.c:(.text+0x6c0): undefined reference to `open64'

can anyone tell me how to go about fixing this?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080723/26326e33/attachment.htm 
