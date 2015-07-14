From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 12:23:40 +0200
Subject: [Buildroot] [PATCH] package: fix fallout from checking kconfig
 config files
In-Reply-To: <1436868801-14596-1-git-send-email-yann.morin.1998@free.fr>
References: <1436868801-14596-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150714122340.7c2c042a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 14 Jul 2015 12:13:21 +0200, Yann E. MORIN wrote:
> Those checks should only be dione when the package is actually enabled.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/busybox/busybox.mk | 2 +-
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
