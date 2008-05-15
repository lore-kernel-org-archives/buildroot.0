From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 May 2008 14:28:00 +0200
Subject: [Buildroot] How to add a new package?
In-Reply-To: <1210796316.3291.5.camel@localhost>
References: <1210695461.3289.16.camel@localhost>
	<1CF6EDDF0820924DA43C9A52FE7325950B6CA51E@MI8NYCMAIL17.Mi8.com>
	<1210796316.3291.5.camel@localhost>
Message-ID: <20080515142800.234b4a9f@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 May 2008 22:18:36 +0200,
Conny Marco Menebr?cker <menebroecker@web.de> a ?crit :

> Thanks for the answer, but I had added the line before.
> Have I to run something else, than 'make menuconfig'?
> Have I to run 'make clean' or something else?

No, just "make menuconfig". If the menu entry doesn't appear, it's
probably because your Config.in changes are not correct.

Can you send the patch corresponding to your Buildroot modifications ?
That way, instead of trying to guess in the dark, we could actually
help you.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080515/0ea76b28/attachment-0001.pgp 
