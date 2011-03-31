From: Tristan Lelong <blunderer@blunderer.org>
Date: Thu, 31 Mar 2011 17:56:38 +0200
Subject: [Buildroot] [PATCH] Adding a XML C library made for embedded systems
In-Reply-To: <AANLkTikHgdgEPv0qqZZkTokUkdCB6LhLaJPo54MM+4nV@mail.gmail.com>
References: <AANLkTikHgdgEPv0qqZZkTokUkdCB6LhLaJPo54MM+4nV@mail.gmail.com>
Message-ID: <AANLkTi=HxUyCuSw_j6SpM64vxatdTnSQw5A2G812AZfO@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I wrote a library called libroxml that can read / write xml files very
easily (and handle xpath).
The binary is about 40K after strip, and performances are quite good
compared to libxml2 (even if it is far from being as complete as
libxml2).
I think it will be enought for most XML uses.
The licence is LGPL.
You can find some more info on http://libroxml.googlecode.com

The patch for adding libroxml to buildroot-2011.02 is attached.

Regards

-- 
618FE3EF
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2011.02-add-libroxml.patch
Type: text/x-patch
Size: 1809 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110331/cb4a2ff3/attachment.bin>
