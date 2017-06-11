From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:53:41 +0200
Subject: [Buildroot] [PATCH] package/qt5base: enable static build for
 BR2_PACKAGE_QT5BASE_TSLIB
In-Reply-To: <20170608133214.13454-1-martin.kepplinger@ginzinger.com>
References: <20170608133214.13454-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170611155341.7f6163fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Jun 2017 15:32:14 +0200, Martin Kepplinger wrote:
> The dependency on !BR2_STATIC_LIBS was here because of tslib not supporing
> static builds. But since
> 
>    commit 05fadfea1 ("package/tslib: enable statically linked building")
> 
> it does and we can remove this dependecy.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---
>  package/qt5/qt5base/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
