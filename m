From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 10:55:08 +0200
Subject: [Buildroot] [PATCH] mesa3d: needs NPTL threading
In-Reply-To: <e7a6b270dba399ed52c5d6b04e9625b880347e0e.1397971843.git.baruch@tkos.co.il>
References: <e7a6b270dba399ed52c5d6b04e9625b880347e0e.1397971843.git.baruch@tkos.co.il>
Message-ID: <20140420105508.74108f37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 20 Apr 2014 08:30:43 +0300, Baruch Siach wrote:
> Strictly speaking, linuxthreads (new) should be enough, since it includes
> pthread_barrier_* implementation. However, we currently have no clean way to
> distinguish between LT and LT.old.
> 
> Fixes:
> http://autobuild.buildroot.net/results/66a/66a9d2c664e0a9b2b0c51b998c72c2ceda90ff9b/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/mesa3d/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
