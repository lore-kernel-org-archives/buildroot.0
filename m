From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 15:55:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/nodejs: remove support for
 express
In-Reply-To: <1494076754-3224-1-git-send-email-martin@barkynet.com>
References: <1494076754-3224-1-git-send-email-martin@barkynet.com>
Message-ID: <20170506155550.10c369a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 May 2017 14:19:12 +0100, Martin Bark wrote:
> BR2_PACKAGE_NODEJS_MODULES_EXPRESS has been deprecated.  To continue using
> add express to BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
> 
> Fixes:
> http://autobuild.buildroot.org/results/fcfa38e98c22c8809452f7d0ee86dfe2e9d2482f
> http://autobuild.buildroot.org/results/946996fa78c7814d1e0ea0ef1239c6eb0c7aa8dd
> http://autobuild.buildroot.org/results/df920e7b17617f1e4867d94eda52cab38f7b0622
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  Config.in.legacy         |  8 ++++++++
>  package/nodejs/Config.in | 10 ----------
>  package/nodejs/nodejs.mk |  1 -
>  3 files changed, 8 insertions(+), 11 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
