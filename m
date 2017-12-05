From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 5 Dec 2017 16:52:55 +0100
Subject: [Buildroot] [PATCH 1/1] glorytun: new package
In-Reply-To: <20171205114455.21602-1-adrien@gallouet.fr>
References: <20171205114455.21602-1-adrien@gallouet.fr>
Message-ID: <20171205155255.GA4585@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrien,

On Tue, Dec 05, 2017 at 11:44:55AM +0000, Adrien Gallou?t wrote:
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> diff --git a/package/Config.in b/package/Config.in
> index 433224c3a4..b3c1471dc5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1655,6 +1655,7 @@ menu "Networking applications"
>  	source "package/gesftpserver/Config.in"
>  	source "package/gupnp-tools/Config.in"
>  	source "package/gutenprint/Config.in"
> +	source "package/glorytun/Config.in"
>  	source "package/hans/Config.in"
>  	source "package/hiawatha/Config.in"
>  	source "package/hostapd/Config.in"

This does not follow the chronological order.

> diff --git a/package/glorytun/Config.in b/package/glorytun/Config.in
> new file mode 100644
> index 0000000000..93c1afd8cd
> --- /dev/null
> +++ b/package/glorytun/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_GLORYTUN
> +	bool "glorytun"
> +	select BR2_PACKAGE_LIBSODIUM
> +	help
> +	  A small, simple and secure VPN.
> +	  https://github.com/angt/glorytun
> diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
> new file mode 100644
> index 0000000000..099dcef6d0
> --- /dev/null
> +++ b/package/glorytun/glorytun.hash
> @@ -0,0 +1 @@
> +sha256	76849b1568119cf0834749db56d4882966863d31351c21c1b22f373f0c97a498  glorytun-0.0.93-mud.tar.gz

Please calculate hash for license-file as well.

Best regards
Marcus Folkesson
