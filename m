From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:00:30 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/qt5webkit: fix bison-3.7.1
 related compile failure
In-Reply-To: <20200918195852.6999-1-ps.report@gmx.net>
References: <20200918195852.6999-1-ps.report@gmx.net>
Message-ID: <20200919150030.3bcdbcc1@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Sep 2020 21:58:50 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add gentoo patch to fix bison-3.7.1 related compile failure and
> an additional one doing a similare change for another bison call
> in Source/WebCore/DerivedSources.pri.
> 
> Fixes:
> 
>   generated/XPathGrammar.tab.c:124:10: fatal error: XPathGrammar.tab.h: No such file or directory
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - re-ordered to first patch as needed by qt5webkit-5.9.1/qt-5.15.0
>     (before qt version bump)
> ---
>  ...te-the-header-directly-to-fix-build-.patch | 52 +++++++++++++++++++
>  ...te-the-header-directly-to-fix-build-.patch | 31 +++++++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 package/qt5/qt5webkit/0007-Let-Bison-generate-the-header-directly-to-fix-build-.patch
>  create mode 100644 package/qt5/qt5webkit/0008-let-bison-generate-the-header-directly-to-fix-build-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
