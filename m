From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 8 Jun 2009 13:41:51 +0200
Subject: [Buildroot] /dev nodes files
In-Reply-To: <874ouryix1.fsf@macbook.be.48ers.dk>
References: <20090607184843.GK26148@buzzloop.caiaq.de>
	<874ouryix1.fsf@macbook.be.48ers.dk>
Message-ID: <20090608114151.GR26148@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 07, 2009 at 08:53:46PM +0200, Peter Korsgaard wrote:
>  Daniel> After each build, the ixnodes in project_build_arm/uclibc/root/dev are
>  Daniel> regular files rather than inodes, which prevents users from exporting
>  Daniel> that directory directly as NFS root. Most people run custom scripts to
>  Daniel> fix that, but I wonder whether there is any change to get that fixed in
>  Daniel> BR2 directly.
> 
> Ehh, that's on purpose (E.G. so you don't need root permissions to
> build). Just select the tarball target and extract it on your nfs
> server.
> 
>  Daniel> Any oppinion about such an approach?
> 
> What would this buy us that the tarball target doesn't give?

Ok, understood. Thanks :)

Daniel
