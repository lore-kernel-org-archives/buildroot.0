From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:13:09 +0200
Subject: [Buildroot] [PATCH] package/ejmalloc: needs threads
In-Reply-To: <1468775770-23043-1-git-send-email-yann.morin.1998@free.fr>
References: <1468775770-23043-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160718231309.0df120b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 19:16:10 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/73c/73c437fb932a30bae17653173e8ce35cc91757ef/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/jemalloc/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied after fixing the commit title typo. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
