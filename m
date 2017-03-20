From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:56:43 +0100
Subject: [Buildroot] [PATCH 1/2] keepalived: fix libnl optional
 dependnecy
In-Reply-To: <15be326b7457179e1789109c706479ec13e7c8ad.1490043162.git.baruch@tkos.co.il>
References: <15be326b7457179e1789109c706479ec13e7c8ad.1490043162.git.baruch@tkos.co.il>
Message-ID: <20170320215643.702f2016@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 22:52:41 +0200, Baruch Siach wrote:
> List libnl as a dependency when it is enabled. Make sure that libnfnetlink is
> actually enabled when listing it as a dependency.
> 
> Cc: Ilias Apalodimas <apalos@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Drop the libnfnetlink select; update commit log (Thomas P)
> ---
>  package/keepalived/keepalived.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
