From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:37:45 +0200
Subject: [Buildroot] [PATCH] post-image: Do not hardcode the
 genimage.cfg path
In-Reply-To: <1463171605-15987-1-git-send-email-festevam@gmail.com>
References: <1463171605-15987-1-git-send-email-festevam@gmail.com>
Message-ID: <20160513223745.26f5d118@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 17:33:25 -0300, Fabio Estevam wrote:
> Instead of hardcoding the genimage.cfg path, let's add a BOARD_DIR
> variable to improve readability.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx6ulevk/post-image.sh | 3 ++-
>  board/via/imx6_vab820/post-image.sh     | 3 ++-
>  board/wandboard/post-image.sh           | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

Applied to next, thanks.

(Retrospectively, I should have changed the title of your commit.
Something like:

	configs: don't hardcode board directory path in Freescale post-image scripts

or something along those lines. But now that I've pushed it, too late.)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
