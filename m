From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 14 Oct 2016 16:46:33 +0200
Subject: [Buildroot] [PATCH v2 1/2] ustream-ssl: new package
In-Reply-To: <1474536319-12268-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1474536319-12268-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <ca62f904-619e-ff77-f583-2c0a2c60c294@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rahul,

On 22/09/16 11:25, Rahul Jain wrote:
[snip]
> diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
> new file mode 100644
> index 0000000..d8f8aed
> --- /dev/null
> +++ b/package/ustream-ssl/ustream-ssl.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# ustream-ssl
> +#
> +################################################################################
> +
> +USTREAM_SSL_VERSION = ec80adaa1b47f28d426fa19c692011ce60b992d6
> +USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
> +USTREAM_SSL_LICENSE = ISC

USTREAM_SSL_LICENSE_FILES should be here as well. If there is no license 
file, you could point to any .c or .h file containing some license info.

Regards,

Vincent.
