From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Aug 2015 14:18:35 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150805141835.2623B8178A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #3 from CB <christophebricout@yahoo.fr> 2015-08-05 14:18:34 UTC ---
Created attachment 6131
  --> https://bugs.busybox.net/attachment.cgi?id=6131
gmake logfile (issue.txt)

Here the command executed in order to collect the information
===============================
gmake >! issue.txt
configure: WARNING: unrecognized options: --disable-gtk-doc,
--disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation,
--with-xmlto, --with-fop, --enable-ipv6, --disable-debug, --disable-static,
--enable-shared, --enable-liblzma
configure: WARNING: cannot generate manual pages while cross compiling
configure: error: /usr/bin/objcopy cannot create binary files
gmake: ***
[/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/build/grub2-2.00/.stamp_configured]
Error 1
===============================
The issue.txt file is enclosed.

I am available for futher concerns
Thanks a lot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
