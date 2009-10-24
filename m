From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 24 Oct 2009 19:30:17 +0200
Subject: [Buildroot] gtk-doc and autoreconfigured packages
In-Reply-To: <20091024182847.0644398e@surf>
References: <1256252030.25025.36.camel@coalu.atr>
	<20091024182847.0644398e@surf>
Message-ID: <1256405417.28475.28.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 24 octobre 2009 ? 18:28 +0200, Thomas Petazzoni a ?crit :
> Le Fri, 23 Oct 2009 00:53:50 +0200,
> Lionel Landwerlin <llandwerlin@gmail.com> a ?crit :
> 
> > Is this patch going to be integrated soon ? :
> > 
> > http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=gtk-doc-m4-fix&id=b53a6096e4ea53517c7de5f711f381333bd6ac11
> > 
> > It solved problems I had with packages using gtk-doc.
> 
> I found it kind of hackish to include some gtk-specific stuff into the
> automake package. But maybe it's the only way ?
> 

Well... we are just trying to get rid of the gtk-doc package...
The "real" fix would be to install gtk-doc as an host package.
Last time I tried to integrate it, there was too many dependencies... I
will give it another try.


-- 
Lionel Landwerlin <llandwerlin@gmail.com>
