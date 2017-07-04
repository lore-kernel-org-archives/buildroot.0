From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:55:39 +0200
Subject: [Buildroot] [PATCH v5 5/5] package/mke2img: remove package
In-Reply-To: <20170704144729.19753-6-s.martin49@gmail.com>
References: <20170704144729.19753-1-s.martin49@gmail.com>
 <20170704144729.19753-6-s.martin49@gmail.com>
Message-ID: <20170705005539.1a80c542@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 16:47:29 +0200, Samuel Martin wrote:
> From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> Now that we use mkfs to generate ext2/3/4 filesystem image by calling
> mkfs directly from fs/ext2/ext2.mk, we can remove this package.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> changes v4->v5:
> - none

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
