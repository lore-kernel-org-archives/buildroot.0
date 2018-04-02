From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 21:43:25 +0200
Subject: [Buildroot] [PATCH 1/5] cargo: use HOST_CARGO_DL_DIR instead of
 CARGO_DL_DIR
In-Reply-To: <20180402183626.7769-1-maxime.hadjinlian@gmail.com>
References: <20180402183626.7769-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402214325.346c4a69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Apr 2018 20:36:22 +0200, Maxime Hadjinlian wrote:
> The infrastructure only provides HOST_CARGO_DL_DIR, because this
> package is host only. Ideally the infra should provide CARGO_DL_DIR,
> but it doesn't currently, and that requires more significant changes.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/cargo/cargo.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
