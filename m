From: Mathijs Jonker <mathijsjonker@msn.com>
Date: Mon, 12 Dec 2016 08:33:44 +0000
Subject: [Buildroot] wvdial fails reading contents of wvdial.conf
Message-ID: <AM5P195MB0049E089BF7AC66DD623F208B2980@AM5P195MB0049.EURP195.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


I'm having an issue with wvdial being unable to read the config. It's finding the correct file and has found all the needed libraries.

Platform is CM-FX6 (iMX6) using a custom kernel 3.0.35, buildroot version 2016.08.1.


I've attached the wvdial config and strace.


Any leads on where to look would be appreciated.


Cheers!


Mathijs Jonker
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161212/98e4d14b/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: wvdial.conf
Type: application/octet-stream
Size: 445 bytes
Desc: wvdial.conf
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161212/98e4d14b/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: strace
Type: application/octet-stream
Size: 19927 bytes
Desc: strace
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161212/98e4d14b/attachment-0001.obj>
