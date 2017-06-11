From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:54:51 +0200
Subject: [Buildroot] [PATCH v2] package/qt: enable static build for
 BR2_PACKAGE_QT_MOUSE_TSLIB
In-Reply-To: <20170608100312.31806-1-martin.kepplinger@ginzinger.com>
References: <20170608095112.f7z7hnyi4m7vmzta@tarshish>
 <20170608100312.31806-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170611155451.2d713558@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Jun 2017 12:03:12 +0200, Martin Kepplinger wrote:
> The dependency on !BR2_STATIC_LIBS was here because of tslib not supporing
> static builds. But since
> 
>    commit 05fadfea1 ("package/tslib: enable statically linked building")
> 
> it does and we can remove this dependecy.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
