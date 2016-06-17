From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 17 Jun 2016 16:09:52 +0100
Subject: [Buildroot] [PATCH v2 1/1] libuio: new package
In-Reply-To: <1466175690-25379-1-git-send-email-joris.lijssens@gmail.com>
References: <1466175690-25379-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <576412C0.7090600@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joris,

On 17/06/16 16:01, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
> ---
>  package/Config.in          |  1 +
>  package/libuio/Config.in   |  8 ++++++++
>  package/libuio/libuio.hash |  2 ++
>  package/libuio/libuio.mk   | 28 ++++++++++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 package/libuio/Config.in
>  create mode 100644 package/libuio/libuio.hash
>  create mode 100644 package/libuio/libuio.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 3d93951..4c145b5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -404,6 +404,7 @@ endif
>  	source "package/kbd/Config.in"
>  	source "package/lcdproc/Config.in"
>  	source "package/libump/Config.in"
> +	source "package/libuio/Config.in"

alphabetically, libuio comes before libump.

Regards,

Vincent.
