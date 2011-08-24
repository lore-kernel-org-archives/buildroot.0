From: Alexjan Carraturo <axjslack@gmail.com>
Date: Wed, 24 Aug 2011 10:12:30 +0200
Subject: [Buildroot] Login of Buildroot
Message-ID: <CACR8Qs8iO8CmjaW4bf-XYJ3TLvW4oLJVewO4i2Mc5E7e8n0X-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi to all

I don't know if I'm doing that question on the right place

Anyway, I use to compile and use buildroot on my ARM cortex-a9 device,
and usually works perfectly from nand and even via NFS.

Compiling give me little problem (that Peter solved perfectly) on mtd.

Know I'm testing the 22 Aug version, and I found a bad surprise:
usually (in the precedent versions, the last I used was the 22 of
July), when I boot the system ask me User (root), but not the
password, and that is perfect. But, in the version of 22 Aug, when
buildroot arrive to the login, ask me even a password.

I tried to see the "shadow" file, and the file password it's clear, I
check even the "securetty", and my tty is present in that file. I
tried to start in signle mode and change manually the password, and,
even if that write in the "shadow" file, when I reboot, it's
impossibile to make login.

Any Ideas on what can I do?

Thank you in advence and sorry for disturbing.
Alex.


-- 
Alexjan Carraturo
--
Free Software User Group Italia administrator (http://www.fsugitalia.org)
Fedora/OpenSUSE Ambassador
member of FSFE Italian Team

Twitter/Facebook/Identica: axjslack
Blog: http://axjslack.wordpress.com
--
