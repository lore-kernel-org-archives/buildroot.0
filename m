From: Berns <Berns@BEKA-Elektronik.de>
Date: Tue, 11 Dec 2012 15:14:44 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <000301cdd7a8$adeab490$09c01db0$@co.uk>
Message-ID: <NDBBKLDECLOIHFJKBINAAEGDFPAA.Berns@BEKA-Elektronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ted,

I had a simular problem with Ubuntu 12.04.
When I chance the settings to gcc 4.5.x it works for me.

Regards

Rainer
-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]On
Behalf Of Ted Wood
Sent: Tuesday, December 11, 2012 3:06 PM
To: buildroot at uclibc.org
Subject: [Buildroot] (no subject)


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



FGH Controls Limited
Blackhorse Road
Letchworth Garden City, Herts
SG6 1HN
UK

Telephone: +44 (0)1462 686677 Ext. 7112
Fax:       +44 (0)1462 671860
web site:  www.fgh.co.uk

Registered Office:
Blackhorse Road, Letchworth Garden City, SG6 1HN, UK

Registered in England No. 1298491.  VAT Reg No. GB 563 4971 15
