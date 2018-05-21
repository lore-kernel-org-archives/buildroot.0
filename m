From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 10:32:59 +0200
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
In-Reply-To: <20180521082818.4smflx2vq7eucdpr@sapphire.tkos.co.il>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <20180519124412.5d533cf9@windsurf>
 <20180521060756.3r5e7zspbpvxfjjn@sapphire.tkos.co.il>
 <20180521101928.74cdd62e@windsurf>
 <20180521082818.4smflx2vq7eucdpr@sapphire.tkos.co.il>
Message-ID: <20180521103259.09851362@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 11:28:18 +0300, Baruch Siach wrote:

> > ./tirpc/rpc/rpcb_prot.x
> > ./tirpc/rpcsvc/crypt.x
> > ./tirpc/rpcsvc/key_prot.x  
> 
> The libtirpc tarball bundles these generated files. But for some reason we 
> regenerate them from C.

Hu ? Those .x files are not the generated files. Those are the source
files. rpcgen reads .x files and generates C code. You seem to have
understood it backwards.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
