From: Scott Dudley <scott@telesoft.com>
Date: Mon, 01 Nov 2010 11:28:40 -0700
Subject: [Buildroot] What Version for Java Support
Message-ID: <4CCF06D8.3070406@telesoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I need a uClibc cross toolchain that supports Java (GCJ) for the 386 or 
486 target on my x86_64 host.  I tried buildroot-2010.08 but it wouldn't 
build.  Without tinkering, I tried the latest from git and everything 
builds find.  I tried setting the BR2_INSTALL_LIBGCJ variable in my 
.config file but it appears to get removed when I run make and gcj 
doesn't get compiled.  Saw a thread that suggested Java support had been 
or was going to be deprecated.

Can you tell me what the most current version of buildroot is that 
supports gcj and will build on my 64-bit host?

Many thanks.

-- 
Scott Dudley
Senior Developer

Telesoft Corp. | 3443 N. Central Ave., 18th Floor | Phoenix, AZ, 85012

*o:* (602) 308-1115* *| *f:* (602) 308-1300 | *w:* www.telesoft.com 
<http://www.telesoft.com/?utm_source=signature&utm_medium=email&utm_campaign=signature>

<http://www.telesoft.com/?utm_source=signature&utm_medium=email&utm_campaign=signature> 
<http://www.telesoft.com/sites/default/files/go/signature.html>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101101/4f28f9a9/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: sig-logo.png
Type: image/png
Size: 1902 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101101/4f28f9a9/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: sig-right.png
Type: image/png
Size: 24470 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101101/4f28f9a9/attachment-0003.png>
