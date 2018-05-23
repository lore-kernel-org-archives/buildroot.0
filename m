From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 07:58:05 +0200
Subject: [Buildroot] [PATCH v2 1/6] libtirpc: add host package
In-Reply-To: <e1a18302-1cb8-40f7-f7b3-b5bcfa389075@mind.be>
References: <176e048d628384df6d3b2d82f2b9c7e4cf58892e.1526985017.git.baruch@tkos.co.il>
 <e1a18302-1cb8-40f7-f7b3-b5bcfa389075@mind.be>
Message-ID: <20180523075805.3f93b462@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 May 2018 00:21:05 +0200, Arnout Vandecappelle wrote:

> > +# Don't build anything for host; we only need the headers
> > +HOST_LIBTIRPC_CONFIGURE_CMDS = true
> > +HOST_LIBTIRPC_BUILD_CMDS = true  
> 
>  Since we're not actually using any of the autotools (and since we can't,
> because rpcgen is missing), I'd make it a host-generic-package instead of
> host-autotools-package. There is at least one other package (can't remember
> which one) where we do this.

Indeed, this sounds like a good idea.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
