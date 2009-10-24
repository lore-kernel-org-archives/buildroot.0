From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Oct 2009 18:28:47 +0200
Subject: [Buildroot] gtk-doc and autoreconfigured packages
In-Reply-To: <1256252030.25025.36.camel@coalu.atr>
References: <1256252030.25025.36.camel@coalu.atr>
Message-ID: <20091024182847.0644398e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 23 Oct 2009 00:53:50 +0200,
Lionel Landwerlin <llandwerlin@gmail.com> a ?crit :

> Is this patch going to be integrated soon ? :
> 
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=gtk-doc-m4-fix&id=b53a6096e4ea53517c7de5f711f381333bd6ac11
> 
> It solved problems I had with packages using gtk-doc.

I found it kind of hackish to include some gtk-specific stuff into the
automake package. But maybe it's the only way ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
