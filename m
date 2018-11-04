From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 11:44:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: added support for
 PostgreSQL (non-PDO).
In-Reply-To: <20181020214841.19072-1-bernd.kuhls@t-online.de>
References: <20181020214841.19072-1-bernd.kuhls@t-online.de>
Message-ID: <20181104114418.42867b93@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Oct 2018 23:48:41 +0200, Bernd Kuhls wrote:
> Needed for example for phppgadmin.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/Config.ext | 12 ++++++++++++
>  package/php/php.mk     |  6 ++++++
>  2 files changed, 18 insertions(+)

Applied to master after adding a dependency on BR2_USE_WCHAR, which has
been added to BR2_PACKAGE_POSTGRESQL since you sent your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
