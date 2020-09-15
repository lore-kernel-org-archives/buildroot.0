From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 16 Sep 2020 00:24:19 +0200
Subject: [Buildroot] [PATCH] package/sentry-cli: new package
In-Reply-To: <20200915205738.2144347-1-joseph.kogut@gmail.com>
References: <20200915205738.2144347-1-joseph.kogut@gmail.com>
Message-ID: <36b125ea-f543-c99e-28e1-df12a985881e@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph and all,

On 15/09/20 22:57, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   DEVELOPERS                         |  1 +
>   package/Config.in.host             |  1 +
>   package/sentry-cli/Config.in.host  | 10 ++++++++
>   package/sentry-cli/sentry-cli.hash |  3 +++
>   package/sentry-cli/sentry-cli.mk   | 39 ++++++++++++++++++++++++++++++
>   5 files changed, 54 insertions(+)
>   create mode 100644 package/sentry-cli/Config.in.host
>   create mode 100644 package/sentry-cli/sentry-cli.hash
>   create mode 100644 package/sentry-cli/sentry-cli.mk

[...]

> diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
> new file mode 100644
> index 0000000000..b71f7f2f9b
> --- /dev/null
> +++ b/package/sentry-cli/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_SENTRY_CLI
> +	bool "sentry-cli"

Should be "host sentry-cli"

Apart from this small comment,
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>

Cheers,
Titouan
