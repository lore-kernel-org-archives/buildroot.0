From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 17:39:09 +0200
Subject: [Buildroot] [PATCH 3/4] linux: bump default to version 4.16
In-Reply-To: <1522856068-17209-3-git-send-email-festevam@gmail.com>
References: <1522856068-17209-1-git-send-email-festevam@gmail.com>
 <1522856068-17209-3-git-send-email-festevam@gmail.com>
Message-ID: <20180404173909.044be82d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 12:34:27 -0300, Fabio Estevam wrote:
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  linux/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

A series from Bernd has already been sent to do this, and it is
actually a bit more complete, because it takes into account the fact
that Linux 4.16 now requires host-bison and host-flex.

See http://patchwork.ozlabs.org/project/buildroot/list/?series=36984

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
