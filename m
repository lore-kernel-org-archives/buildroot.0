From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:51:38 +0100
Subject: [Buildroot] [PATCH 2/7] sysrepo: fix a typo when installing
 with systemd
In-Reply-To: <9e6a587f377bd63fc0361934d3ea88bc50ef075a.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <9e6a587f377bd63fc0361934d3ea88bc50ef075a.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <20191208225138.2f4c87a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Dec 2019 10:05:47 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  package/sysrepo/sysrepo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The commit title prefix should have been "package/sysrepo:", so I fixed
that and applied. Thanks Jan!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
