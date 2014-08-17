From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:21:29 +0200
Subject: [Buildroot] [PATCH v2 3/3] php: add pdo_pgsql extension
In-Reply-To: <1407938231-22544-3-git-send-email-bos@je-eigen-domein.nl>
References: <1407938231-22544-1-git-send-email-bos@je-eigen-domein.nl>
 <1407938231-22544-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20140817212129.034c7fc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Wed, 13 Aug 2014 15:57:11 +0200, Floris Bos wrote:
> Adds support for the PDO PostgreSQL extension to the PHP package.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/php/Config.ext | 10 ++++++++++
>  package/php/php.mk     |  4 ++++
>  2 files changed, 14 insertions(+)

Applied to next, with a minor change.


> +comment "PostgreSQL needs an (e)glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

I've changed this to "PostgreSQL driver needs..."

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
