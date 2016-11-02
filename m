From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 02 Nov 2016 20:10:51 +0100
Subject: [Buildroot] [PATCH] libglob: new package
In-Reply-To: <20161025215508.7fe47ff8@free-electrons.com>
References: <20160801195836.30837-1-joerg.krause@embedded.rocks>
 <20161025215508.7fe47ff8@free-electrons.com>
Message-ID: <1478113851.3590.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2016-10-25 at 21:55 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,??1 Aug 2016 21:58:36 +0200, J?rg Krause wrote:
> > libglob is the OpenBSD implementation of glob(3).
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> I've applied your patch, with one minor change (see below).
> 
> I remember this was necessary to fix the build of a package with
> musl.
> Do you remember which one?

Yes, it was openswan.

J?rg
