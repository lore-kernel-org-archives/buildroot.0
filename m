From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 05 Mar 2012 17:50:50 +0100
Subject: [Buildroot] [Patch v1 1/1] Bump to latest 5.1.60 version
In-Reply-To: <1330964246-20475-1-git-send-email-sagaert.johan@skynet.be>
References: <1330964246-20475-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <4F54EEEA.6050906@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert,

Sagaert Johan wrote:
> Signed-off-by: Sagaert Johan<sagaert.johan@skynet.be>
> ---
>   package/mysql_client/mysql_client.mk |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
> index 9addf33..f4dd09e 100644
> --- a/package/mysql_client/mysql_client.mk
> +++ b/package/mysql_client/mysql_client.mk
> @@ -3,7 +3,7 @@
>   # MySQL 5.1 Client
>   #
>   #############################################################
> -MYSQL_CLIENT_VERSION = 5.1.53
> +MYSQL_CLIENT_VERSION = 5.1.60
>   MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
>   MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
>   MYSQL_CLIENT_INSTALL_TARGET = YES

There are patches for this package whose file name reflects the
current version. These files should be removed if they are not
needed anymore, renamed otherwise.

Also, in your commit message you should mention the package
name (mysql_client: bump to.....).

Luca
