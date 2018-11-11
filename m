From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 22:08:07 +0100
Subject: [Buildroot] [PATCH 1/1] libkrb5: fix build on riscv
In-Reply-To: <CAPi7W80ucvAmN6PDtBbNxfYFniJ1kveZ_Q3yTHiXbpabYkhbSQ@mail.gmail.com>
References: <20181111175210.14031-1-fontaine.fabrice@gmail.com>
 <20181111205343.76b10bff@windsurf.home>
 <CAPi7W839q1wsnB9u99kUy8BnGAQg61inS=2+aEh+jO9_Yc5ftA@mail.gmail.com>
 <20181111213112.417acc8b@windsurf.home>
 <CAPi7W80ucvAmN6PDtBbNxfYFniJ1kveZ_Q3yTHiXbpabYkhbSQ@mail.gmail.com>
Message-ID: <20181111220807.62f45653@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Nov 2018 21:39:26 +0100, Fabrice Fontaine wrote:

> > This commit is in gcc upstream since gcc 7.1.0. So I guess we could
> > drop the ARC-specific workaround on libmicrohttpd, since we don't
> > really support "old" gcc versions on ARC anyway.  
> OK, are you ok to do this patch? I assume that the patch on
> libmicrohttpd for riscv is still valid or do you want that I made a
> patch serie on libmicrohttpd?

I applied your libmicrohttpd patch, and I'll do the same with the
libkrb5 patch. We can drop the libmicrohttpd work-around for ARC
at a later point.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
