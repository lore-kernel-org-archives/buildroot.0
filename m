From: Norman Cheung <brjerome.1@gmail.com>
Date: Wed, 30 Jul 2008 11:44:07 -0700
Subject: [Buildroot] Atmel 9260 EABI build
Message-ID: <4890B677.1060503@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am having similar issues:
- OABI works but not EABI(kernel works but not root fs),
- fails at init/login respawning
- Also EABI kernel can mount an NFS root(glibc not build by buildroot)
The behavior looked similar to this post (June 2007) 
http://www.busybox.net/lists/buildroot/2007-June/003206.html

I also noticed that the sub-arch is not set.  I wonder what is the 
correct setting for an EABI build? with or without 926t?

Thanks,
Norman
