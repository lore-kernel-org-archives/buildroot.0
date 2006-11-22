From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 22 Nov 2006 22:34:59 +0100
Subject: [Buildroot] patch: target/cpio
In-Reply-To: <20061122191759.GB1613@aon.at>
References: <20061120154423.GG3065@priv.blacknet.de>
	<20061120180143.456f1bd0.philippe.ney@pardes.ws>
	<20061121095514.GK3065@priv.blacknet.de>
	<20061122195646.9173ef42.philippe.ney@pardes.ws>
	<20061122191759.GB1613@aon.at>
Message-ID: <20061122223459.91499561.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >+config BR2_PACKAGE_CPIO
> >+	bool "cpio"
> >+	default n
> >+	help
> >+	  Archiver that handles various types of cpio and tar archives
> >+	  (Busybox cpio doesn't support archive generation)
> 
> We should rather add write support to busybox's ar/cpio et al, IMO.
> 

Yes sure. It was just more simple for me to use the cpio sources rather
than working on Busybox ones.

As this seems to be of interests for Goetz Bock, I posted.

Philippe
