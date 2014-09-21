From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:17:23 +0200
Subject: [Buildroot] [PATCH] package/genpart: make it a target package,
 too
In-Reply-To: <1411249705-13968-1-git-send-email-yann.morin.1998@free.fr>
References: <1411249705-13968-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140921211723.17962c32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 20 Sep 2014 23:48:25 +0200, Yann E. MORIN wrote:
> genpart comes handy when there is a need to programatically generate
> partition tables, without the need for a full partitioning program like
> fdisk et al.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in          | 1 +
>  package/genpart/Config.in  | 8 ++++++++
>  package/genpart/genpart.mk | 1 +
>  3 files changed, 10 insertions(+)
>  create mode 100644 package/genpart/Config.in

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
