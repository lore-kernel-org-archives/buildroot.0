From: Goetz Bock <bock@blacknet.de>
Date: Thu, 23 Nov 2006 09:19:04 +0100
Subject: [Buildroot] patch: target/cpio
In-Reply-To: <20061122223459.91499561.philippe.ney@pardes.ws>
References: <20061120154423.GG3065@priv.blacknet.de>
	<20061120180143.456f1bd0.philippe.ney@pardes.ws>
	<20061121095514.GK3065@priv.blacknet.de>
	<20061122195646.9173ef42.philippe.ney@pardes.ws>
	<20061122191759.GB1613@aon.at>
	<20061122223459.91499561.philippe.ney@pardes.ws>
Message-ID: <20061123081904.GM3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, Nov 22 '06 at 22:34, Philippe Ney wrote:
> > >+config BR2_PACKAGE_CPIO
> > >+	bool "cpio"
> > >+	default n
> > >+	help
> > >+	  Archiver that handles various types of cpio and tar archives
> > >+	  (Busybox cpio doesn't support archive generation)
> > 
> > We should rather add write support to busybox's ar/cpio et al, IMO.
> > 
> 
> Yes sure. It was just more simple for me to use the cpio sources rather
> than working on Busybox ones.
> 
> As this seems to be of interests for Goetz Bock, I posted.

And I appreciated it, thanks.
--  
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
