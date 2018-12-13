From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:26:54 +0100
Subject: [Buildroot] [PATCH] package/lldpd: fix readline dependency
In-Reply-To: <20181210154822.24110-1-thomas.petazzoni@bootlin.com>
References: <20181210154822.24110-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181213222654.4463a19a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 16:48:22 +0100, Thomas Petazzoni wrote:
> lldpd can optionally depend on readline, but readline is never added
> to LLDPD_DEPENDENCIES, which this commit fixes.
> 
> This was detected using per-package directories.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/lldpd/lldpd.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
