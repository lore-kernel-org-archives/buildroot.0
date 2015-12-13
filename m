From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:37:20 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/liburcu: introduce
 BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS symbol
In-Reply-To: <1450032471-3405-1-git-send-email-s.martin49@gmail.com>
References: <1450032471-3405-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20151213223720.5a43daf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 13 Dec 2015 19:47:48 +0100, Samuel Martin wrote:
> This new hidden symbol will allow simplifying the architecture dependencies
> on package that depends on liburcu. These packages will be updated in follow-up
> patches.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2:
> - new patch
> ---
>  package/liburcu/Config.in | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

All four patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
