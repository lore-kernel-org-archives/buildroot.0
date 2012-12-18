From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 18 Dec 2012 23:57:38 +0200
Subject: [Buildroot] elfutils successfully compiled with buildroot 2012.05
Message-ID: <50D0E6D2.6040602@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello to all

I just want to tell that I have now managed to complete building
elfutils version 0.155
successfully with Buildroot version 2012.05.

After some sleep (and patch cleanup) I will send it here for initial review.
Not all of it went smoothly but I will explain it in more detail in the
patches.

There are few screenshots of my uClibc environment under VirtualBox
with working readelf from elfutils package.

Regards
Stefan

P.S.:  AFAIK, Glib from version 2.32 and up needs elfutils (or at least
it's libelf component)
as hard dependency ????



-------------- next part --------------
A non-text attachment was scrubbed...
Name: screenshot01.png
Type: image/png
Size: 3946 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121218/144fbcb0/attachment-0004.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: screenshot02.png
Type: image/png
Size: 5322 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121218/144fbcb0/attachment-0005.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: screenshot03.png
Type: image/png
Size: 3303 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121218/144fbcb0/attachment-0006.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: screenshot04.png
Type: image/png
Size: 9402 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121218/144fbcb0/attachment-0007.png>
