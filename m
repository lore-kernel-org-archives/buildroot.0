From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 15 Nov 2016 17:25:23 +0000
Subject: [Buildroot] [Rejected v2 1/7] qt5webkit: Get sources from
 Qt-5-unofficial-builds
In-Reply-To: <8097ee8d-51f9-4709-a1e5-ca4422b6170f@MAIL-SINTERS-01.sinters-int.fr>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <20161115171307.7499-2-corjon.j@ecagroup.com>
 <1479230128.10985.10.camel@synopsys.com>
 <8097ee8d-51f9-4709-a1e5-ca4422b6170f@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <1479230669.10985.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Tue, 2016-11-15 at 17:22 +0000, Julien CORJON wrote:
> Alexey,
> 
> Le 15/11/2016 ? 18:16, Alexey Brodkin a ?crit :
> > 
> > Hi Julien,
> > 
> > On Tue, 2016-11-15 at 18:13 +0100, Julien Corjon wrote:
> > > 
> > > Instead of messing with git we may get tarballs of obsolete but still
> > > existing submodules as we used to but from a bit different location.
> > > 
> > > It turned out Qt people still create packages for obsolete submodules
> > > for so-called "unofficial builds", see [1].
> > > 
> > > [1] https://wiki.qt.io/Qt-5-unofficial-builds
> > > 
> > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> > > ---
> > > ?package/qt5/qt5.mk???????????????????|??1 +
> > > ?package/qt5/qt5webkit/qt5webkit.hash |??4 ++--
> > > ?package/qt5/qt5webkit/qt5webkit.mk???| 14 +++-----------
> > > ?3 files changed, 6 insertions(+), 13 deletions(-)
> > 
> > I'm wondering what does this mean?
> > 3 hours ago you sent email saying "Reviewed-by" and now reject?
> 
> Sorry for confusion, my whole series is to reject as it's a bump for a?
> beta version of Qt (that we do not want in BR mainline).
> But as i like your patch a lot (or it simply ease the bump in my series?
> ;) ), I use your patch.
> 
> So yes, your patch is reviewed and my series is to reject!

So I got confused because you CCed me via my Gmail address for
your series and I didn't see it immediately. But now I realized what
was happening.

-Alexey
