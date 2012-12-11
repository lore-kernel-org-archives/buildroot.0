From: Ted Wood <ted@fgh.co.uk>
Date: Tue, 11 Dec 2012 14:06:11 -0000
Subject: [Buildroot] (no subject)
Message-ID: <000301cdd7a8$adeab490$09c01db0$@co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're completely new to Embedded Linux, and were hoping to use Buildroot as
the basis for a new project.

 

I'm using the November 2012 release.

 

I'm trying to build for an i586 using the internal toolchain. The make fails
with the error "It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately uLibc was built without large file support"

 

I'm pretty sure I didn't request that when I was doing menuconfig. Web
search suggests that this problem has occurred elsewhere.

 

 

Anything you can suggest?

 

Cheers

Ted

 

 

 

Ted Wood MSc CEng

Chief Engineer

 

cid:bc29d615-e5df-4082-baad-917a15f44dde

 

FGH Controls Limited

Blackhorse Road

Letchworth Garden City, Herts

SG6 1HN

UK

 

Telephone: +44 (0)1462 686677 Ext. 7112

Fax:       +44 (0)1462 671860

web site:   <http://www.fgh.co.uk/> www.fgh.co.uk

 

Registered Office:

Blackhorse Road, Letchworth Garden City, SG6 1HN, UK

 

Registered in England No. 1298491.  VAT Reg No. GB 563 4971 15

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121211/d0f1cfe1/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.jpg
Type: image/jpeg
Size: 4500 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121211/d0f1cfe1/attachment-0001.jpg>
