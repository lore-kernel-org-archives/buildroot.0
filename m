From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 22:13:21 +0100
Subject: [Buildroot] [PATCH v2] dbus: remove init script status op
In-Reply-To: <9db6a8643a625337a6b477efd537a9245a26f594.1485982122.git.baruch@tkos.co.il>
References: <9db6a8643a625337a6b477efd537a9245a26f594.1485982122.git.baruch@tkos.co.il>
Message-ID: <20170201221321.64b1c0be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Feb 2017 22:48:42 +0200, Baruch Siach wrote:
> The status command calls the Upstrat status utility which we don't have.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Correct the commit log (Thomas P)
> ---
>  package/dbus/S30dbus | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to master, after fixing the typo in the commit log, as noticed
by Peter Seiderer.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
