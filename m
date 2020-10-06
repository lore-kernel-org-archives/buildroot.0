From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:49:51 +0200
Subject: [Buildroot] [PATCH 0/3 v2] package/kmod: add support for
 compressed modules (branch yem/host-kmod-z)
In-Reply-To: <cover.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <20201006214951.48e2d770@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 May 2020 15:09:58 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (3):
>       package/kmod: explicitly disable compression when not enabled
>       package/kmod: add option for host variant
>       package/lmod: add compression support for the host variant

Thanks, I've applied after taking into account the review comments from
Matt Weber.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
