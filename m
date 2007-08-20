From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 20 Aug 2007 17:22:18 +0100
Subject: [Buildroot] [PATCH] Fix AVR32 bug where it tries to copy kernel
	image from the wrong place.
Message-ID: <d6cda7730708200922t51933e01m93855c264f355fb8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

   This small one line patch fix the avr32 build, were it fails during
cp of the kernel image.

Chears,
    Thiago A. Correa
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch
Type: application/octet-stream
Size: 494 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070820/bbad3007/attachment.obj 
