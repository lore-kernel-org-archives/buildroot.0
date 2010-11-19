From: Chris Bisnett <cbisnett@gmail.com>
Date: Fri, 19 Nov 2010 18:05:14 -0500
Subject: [Buildroot] Incorrect ARM EABI Version
Message-ID: <AANLkTikz2QUtNCTHMnnZLy2K6hNTdN5UKsVpKdm=wXCs@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have successfully built the armeb-xscale toolchain using the EABI option.
Running readelf -h on the generated binaries gives OS/ABI of "UNIX - System
V" and flags reports "Version4 EABI".  Unfortunately I am trying to build
for a system whose binaries have an OS/ABI of "ARM" and the flags specify
"GNU EABI".  Is there another setting or option in the buildroot config that
will produce binaries using the GNU EABI?  Thanks for any help.

- Chris
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/dd95b83c/attachment.html>
