From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:30:46 +0100
Subject: [Buildroot] [PATCH 3/6 v2] fs: rename internal variable
In-Reply-To: <1a4428b01a76f6189b154cecd1068663ee515332.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
 <1a4428b01a76f6189b154cecd1068663ee515332.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <20181203213046.13ef8f14@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Nov 2018 18:33:13 +0100, Yann E. MORIN wrote:
> In preparation of more renames, rename the variable that points to the
> final users table.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  fs/common.mk | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied to master after changing the name to ROOTFS_FULL_USERS_TABLE as
suggested by Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
