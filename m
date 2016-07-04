From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:40:11 +0200
Subject: [Buildroot] [PATCH 11/83 v2] package/nfs-utils: use
 'menuconfig' instead of 'config'+'menu'
In-Reply-To: <975a2e949c201e16f3e33268347609fcfe4531b7.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <975a2e949c201e16f3e33268347609fcfe4531b7.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704234011.0356fe04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:22 +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/nfs-utils/Config.in | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

I've instead applied a patch that removes the menu...endmenu, because
it was a bit silly to have a sub-menu for just 3 options.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
