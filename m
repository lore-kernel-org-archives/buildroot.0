From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:37:31 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: disable spinlock support
 for riscv64
In-Reply-To: <20181020202219.24489-1-fontaine.fabrice@gmail.com>
References: <20181020202219.24489-1-fontaine.fabrice@gmail.com>
Message-ID: <20181021163731.032fe1f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Oct 2018 22:22:19 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/deebc4b8f615e1216279d6587e91f5654da2ad68
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/postgresql/postgresql.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've changed the condition to use BR2_riscv instead of BR2_RISCV_64,
and then applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
