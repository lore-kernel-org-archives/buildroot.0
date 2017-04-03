From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 14:31:44 +0200
Subject: [Buildroot] [PATCH] libsoc: add host-pkgconf dependency
In-Reply-To: <1491207281-29813-1-git-send-email-yegorslists@googlemail.com>
References: <1491207281-29813-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20170403143144.76a58786@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Apr 2017 10:14:41 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Without pkg-config PKG_CHECK_MODULES won't be expanded
> and ./configure script produces following error message:
> 
> ./configure: line 12237: syntax error near unexpected token `PYTHON,'
> ./configure: line 12237: `	PKG_CHECK_MODULES(PYTHON, python-"$PYTHON_VERSION")'
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/86e/86e04bd2b10527130306451e56a7693ed4b4befd
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/libsoc/libsoc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
