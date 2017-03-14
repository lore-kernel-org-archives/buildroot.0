From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:54:36 +0100
Subject: [Buildroot] [PATCH] keepalived: fix build with musl
In-Reply-To: <69b8d5ef394523118b2ff40a5814e20175a7c5ae.1489519981.git.baruch@tkos.co.il>
References: <69b8d5ef394523118b2ff40a5814e20175a7c5ae.1489519981.git.baruch@tkos.co.il>
Message-ID: <20170314215436.3565c4ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 21:33:01 +0200, Baruch Siach wrote:
> Apply upstream patch ("keepalived/ip_vs: fix integer types") removing non
> standard integer types that musl does not provide.
> 
> Fixes:
> http://autobuild.buildroot.net/results/503/5038874be985ad2b6588150071ced0d6589af601/
> http://autobuild.buildroot.net/results/6e9/6e9f5885de99847a24cc1c3a17adf0cd1606b316/
> http://autobuild.buildroot.net/results/b61/b61c2cfa949c2a20f0702522857d78651207e6d2/
> 
> Cc: Ilias Apalodimas <apalos@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/keepalived/keepalived.hash | 2 ++
>  package/keepalived/keepalived.mk   | 2 ++
>  2 files changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
