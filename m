From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:28:53 +0200
Subject: [Buildroot] [PATCH] qt5base: remove never set
 QT5BASE_CONFIGURE_ENV
In-Reply-To: <68f1652755a14911b5e98255662454f63ddf315f.1432137630.git.baruch@tkos.co.il>
References: <68f1652755a14911b5e98255662454f63ddf315f.1432137630.git.baruch@tkos.co.il>
Message-ID: <20150520232853.3534a4cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 20 May 2015 19:00:30 +0300, Baruch Siach wrote:
> Since 1b54fbc925f4 (qt5base: fix postgresql plugin compile, 2015-02-19)
> QT5BASE_CONFIGURE_ENV is never set. Remove it.
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/qt5/qt5base/qt5base.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
