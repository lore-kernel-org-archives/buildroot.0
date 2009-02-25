From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 25 Feb 2009 09:51:14 +0100
Subject: [Buildroot] Cris strace-4.5.18 patch
Message-ID: <49A50682.2050903@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have this patch laying around for some time. I'm using it 
for our cris embedded target and haven't had any issues with it.

Please apply.

Note, that configure needs to be rebuilt (autoreconf) before
configure.ac changes are employed into the configure script.

Regards,
Hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: strace-cris.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090225/b764499b/attachment-0001.diff>
