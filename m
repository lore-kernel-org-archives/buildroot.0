From: kmk <newnashworks@gmail.com>
Date: Mon, 28 Aug 2006 20:07:36 -0700
Subject: [Buildroot] Issue with buildroot generated toolchain
Message-ID: <e9cc0d0b0608282007h755e312ar636aeeabcc43b922@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I generated a toolchain to support C & C++. My platform
is armeb nommu system. gcc 3.4.6, binutils 2.16.1,
and uclibc 0.9.28.

I compiled a small C program that accesses the command
line arguments (argc, argv). The issue is when it tries
to parse the cmd args, it sees junk. However, it does
see correct argc.

What could be wrong? Any ideas?

Thanks
/kmk
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20060828/531fd23d/attachment.html 
