From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:59:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] boot/uboot: Change from FTP to HTTPS
 for official releases
In-Reply-To: <20200604185548.92373-1-troglobit@gmail.com>
References: <20200604185548.92373-1-troglobit@gmail.com>
Message-ID: <20200604225915.67fb6ef0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Jun 2020 20:55:48 +0200
Joachim Nilsson <troglobit@gmail.com> wrote:

> The HTTPS URL seems to be more reliable and quicker for download than FTP.
> FTP may also be a blocked protocol on some sites and in CI/CD setups.
> 
> Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
> ---
>  boot/uboot/uboot.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
