From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:07:20 +0100
Subject: [Buildroot] [PATCH] dropbear: use https URLs
In-Reply-To: <20180212092150.1ac237c5@x2000>
References: <20180212092150.1ac237c5@x2000>
Message-ID: <20180213220720.3e2d1926@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 09:21:50 +0100, Danilo Bargen wrote:
> While a hash check is being done, it's still better to use a download
> URL with HTTPS.
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> ---
>  package/dropbear/Config.in   | 2 +-
>  package/dropbear/dropbear.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
