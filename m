From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 8 Dec 2018 22:14:00 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump latest version to 5.11.3
In-Reply-To: <20181208203844.GR2561@scaer>
References: <20181207183702.4463-1-ps.report@gmx.net>
 <20181208203844.GR2561@scaer>
Message-ID: <20181208221400.717755da@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 8 Dec 2018 21:38:44 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
Hello Yann,

> Peter, All,
> 
> On 2018-12-07 19:37 +0100, Peter Seiderer spake thusly:
> > qt5base: remove 0005-Export-qt_open64-from-QtCore.patch (taken from upstream [1])
> > 
> > [1] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=4fc4f7b0ce0e6ee186a7d7fe9b5dd20e94efe432
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---  
> [--SNIP--]
> > diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> > index a4fc20ebcf..c4f8fa81dd 100644
> > --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> > +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> > @@ -1,8 +1,8 @@
> > -# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
> > +ed:   package/qt5/qt5script/qt5script.hash# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist  
> 
> Irk? ;-)

Ups, do not know how this could happen..., but patch fixing it is on the way...

Thanks for reporting...

Regards,
Peter

> 
> This is no good, it breaks check-package:
> 
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/131840389
> 
> Regards,
> Yann E. MORIN.
> 
