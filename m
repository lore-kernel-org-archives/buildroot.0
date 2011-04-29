From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Fri, 29 Apr 2011 22:29:09 +0700
Subject: [Buildroot] [PATCH] Setting system banner with plaintext file.
Message-ID: <BANLkTinF-wH2TZBMjQfLWquyGmfh4Oqr=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This gives choice to set system banner with specified
text file, so it is possible to set multiline message
as well as ASCII art to be displayed at login.

This is trivial patch, but I think it is better to set login message during
menuconfig instead of editing /etc/issue from image output. This is my first
attempt to send patch, so please let me know should I miss anything. Thanks
in advance.


Best regards,
DWI

-- 
Good software can't be measured by `wc -l software.c`
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110429/9452aa47/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Setting-system-banner-with-plaintext-file.patch
Type: text/x-patch
Size: 2520 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110429/9452aa47/attachment.bin>
