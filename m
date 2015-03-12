From: Gurumani, Swapna <Swapna.Gurumani@atmel.com>
Date: Thu, 12 Mar 2015 21:47:25 +0000
Subject: [Buildroot] Support for Atmel SAMA5D4 EK
Message-ID: <2FB1B3AE3B157348A234DA96A19CAB72DC300418@DVRMBX01.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I made modifications to sama5d3_defconfig to support atmel's sama5d4-EK Evaluation kit.
Here is a link to Atmel's buildroot github where youc an find sama5d3_defconfig:
https://github.com/linux4sam/buildroot-at91

Please find attached the defconfig file for sama5d4.
I am trying to follow instructions provided her to create a patch:
http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot

But this won't create a patch. Please let me know how to provide a patch. Basically when I type "git format-patch -M -n -s -o outgoing origin/master", nothing happens.
Regards
Swapna

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150312/868aa360/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: sama5d4_defconfig
Type: application/octet-stream
Size: 53230 bytes
Desc: sama5d4_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150312/868aa360/attachment.obj>
