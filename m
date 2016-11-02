From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 02 Nov 2016 23:43:53 +0100
Subject: [Buildroot] [PATCH] libglob: new package
In-Reply-To: <20161102213248.4a27c2d5@free-electrons.com>
References: <20160801195836.30837-1-joerg.krause@embedded.rocks>
 <20161025215508.7fe47ff8@free-electrons.com>
 <1478113851.3590.1.camel@embedded.rocks>
 <20161102213248.4a27c2d5@free-electrons.com>
Message-ID: <1478126633.8549.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2016-11-02 at 21:32 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 02 Nov 2016 20:10:51 +0100, J?rg Krause wrote:
> 
> > > I remember this was necessary to fix the build of a package with
> > > musl.
> > > Do you remember which one???
> > 
> > Yes, it was openswan.
> 
> Do we have the appropriate patches? :-)

Not yet, unfortunately openswan for musl needs more fixing than adding
glob extensions :-(

J?rg
