From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 09:20:58 +0200
Subject: [Buildroot] [PATCH] nvme-cli: bump to version 1.3
In-Reply-To: <20170717201945.9618-1-gpiccoli@linux.vnet.ibm.com>
References: <20170717201945.9618-1-gpiccoli@linux.vnet.ibm.com>
Message-ID: <20170719092058.01651f83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 17:19:45 -0300, Guilherme G. Piccoli wrote:
> nvme-cli had many bugfixes and improvements over the releases.
> Buildroot still has version 0.3, so this patch bumps it to the
> latest upstream release, version 1.3.
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@linux.vnet.ibm.com>
> ---
>  package/nvme/nvme.hash | 2 +-
>  package/nvme/nvme.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
