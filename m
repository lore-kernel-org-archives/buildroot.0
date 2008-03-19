From: Sam Liddicott <sam@liddicott.com>
Date: Wed, 19 Mar 2008 16:47:18 +0000
Subject: [Buildroot] patch for ext3 script
Message-ID: <47E14396.1080109@liddicott.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch uses sfdisk instead of fdisk to partition the disk image.

However the script still doesn't work for me as grub seems to interpret
the geometry different to the mount -o offset which copied the files
there in the fist place.

Sam
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.patch
Type: text/x-diff
Size: 1492 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080319/445afefb/attachment.patch 
