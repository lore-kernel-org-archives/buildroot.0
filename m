From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:48:27 +0200
Subject: [Buildroot] [PATCH v3 02/11] fs/ext2: always pass the number of
 inodes
In-Reply-To: <20170703225106.1492-3-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-3-s.martin49@gmail.com>
Message-ID: <20170704084827.4064819d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 00:50:57 +0200, Samuel Martin wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ... since zero also means auto for the mke2img script, now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v2->v3:
> - reintroduce this change from Yann' series
> ---
>  fs/ext2/ext2.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
