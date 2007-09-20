From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Thu, 20 Sep 2007 08:28:47 +0200
Subject: [Buildroot] libid3tag build broken: Please add zlib
	to	dependency list
In-Reply-To: <145594.52785.qm@web62014.mail.re1.yahoo.com>
References: <145594.52785.qm@web62014.mail.re1.yahoo.com>
Message-ID: <1190269727.9021.23.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 2007-09-19 at 22:50 -0700, Doug the RockRat wrote:
> The package/libid3tag/libid3tag.mk file needs zlib
> added to the dependency.
> 
> Do you want a patch or is this good enough?

Attached a patch, I also cleaned up some rules and typos, so the library
is not rebuilt every time you build.

Diffed against the snapshot from 20070919.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libid3tag-add-zlib-dependancy-and-fix-rules.patch
Type: text/x-patch
Size: 1900 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070920/5817279f/attachment.bin 
