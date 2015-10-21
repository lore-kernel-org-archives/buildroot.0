From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:31:54 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: don't select libtirpc
In-Reply-To: <fb405c0a598411e1b44331de25bee78cc353a401.1444932838.git.baruch@tkos.co.il>
References: <fb405c0a598411e1b44331de25bee78cc353a401.1444932838.git.baruch@tkos.co.il>
Message-ID: <20151021233154.151a082a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 15 Oct 2015 21:13:58 +0300, Baruch Siach wrote:
> Since commit 8f1c4c49a2a (ltp-testsuite: don't link with libtirpc)
> ltp-testsuite does not need libtirpc. Don't select it.
> 
> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ltp-testsuite/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
