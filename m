From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:48:21 +0200
Subject: [Buildroot] [PATCH v3 01/11] package/mke2img: specifying zero
 inodes means auto
In-Reply-To: <20170703225106.1492-2-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-2-s.martin49@gmail.com>
Message-ID: <20170704084821.6d0cb422@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 00:50:56 +0200, Samuel Martin wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, leaving the number of inodes to be autocalculated requires
> the user to not specify the -i option at all.
> 
> Also accept zero as meaning auto; this will help simplify the ext2.mk
> code a little bit.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v2->v3:
> - reintroduce this change from Yann' series
> ---
>  package/mke2img/mke2img | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
