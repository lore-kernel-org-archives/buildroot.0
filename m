From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 22 Nov 2006 20:17:59 +0100
Subject: [Buildroot] patch: target/cpio
In-Reply-To: <20061122195646.9173ef42.philippe.ney@pardes.ws>
References: <20061120154423.GG3065@priv.blacknet.de>
	<20061120180143.456f1bd0.philippe.ney@pardes.ws>
	<20061121095514.GK3065@priv.blacknet.de>
	<20061122195646.9173ef42.philippe.ney@pardes.ws>
Message-ID: <20061122191759.GB1613@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 22, 2006 at 07:56:46PM +0100, Philippe Ney wrote:

>+config BR2_PACKAGE_CPIO
>+	bool "cpio"
>+	default n
>+	help
>+	  Archiver that handles various types of cpio and tar archives
>+	  (Busybox cpio doesn't support archive generation)

We should rather add write support to busybox's ar/cpio et al, IMO.
