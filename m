From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 29 Nov 2010 15:35:53 -0600
Subject: [Buildroot] grub on x86_64
Message-ID: <20101129153553.27944b3q5acnhxwk@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

I'm using an external toolchain (crosstools-ng 1.9.0) and when I try  
to build grub it fails.
It seems that grub only builds on x86_64 if you have a multilib system.
I didn't try building with the buildroot toolchain, since I need glibc.

I tested the build and it works fine on 32 bit.

I also saw that the debian patch is much newer than what's in GIT,  
I'll send in a patch to take care of both.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
