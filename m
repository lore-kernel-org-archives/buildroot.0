From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:03:58 +0200
Subject: [Buildroot] [PATCH 01/11] package/php-amqp: bump version to
 1.10.2
In-Reply-To: <20210629165054.3831930-1-aduskett@gmail.com>
References: <20210629165054.3831930-1-aduskett@gmail.com>
Message-ID: <20210703220358.32f3e1e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Jun 2021 09:50:44 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/php-amqp/php-amqp.hash | 4 ++--
>  package/php-amqp/php-amqp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, I have applied the entire series to master. The only thing I
changed was in PATCH 11/11: I did not keep BR2_PACKAGE_PHP_EXT_JSON in
Config.in.legacy. Indeed, as it is now always enabled in PHP, there's
no point in keeping a legacy entry: people who had the option enabled,
will still have the feature, so there's no point in warning them about
this.

Thanks a lot for this work! I hope php-amqp will soon make a new
release to be able to drop the large patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
