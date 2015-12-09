From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 14:17:24 +0000
Subject: [Buildroot] [PATCH v2 1/3] python-ptyprocess: new package
In-Reply-To: <1449670313-3613-2-git-send-email-viktorin@rehivetech.com>
References: <1446203156-26848-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-1-git-send-email-viktorin@rehivetech.com>
 <1449670313-3613-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <566837F4.8090702@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On 09/12/15 14:11, Jan Viktorin wrote:

[snip]

> diff --git a/package/python-ptyprocess/Config.in b/package/python-ptyprocess/Config.in
> new file mode 100644
> index 0000000..abf8045
> --- /dev/null
> +++ b/package/python-ptyprocess/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PTYPROCESS
> +	bool "python-ptyprocess"
> +	depends on BR2_PACKAGE_PYTHON
> +	help
> +	  Launch a subprocess in a pseudo terminal (pty), and interact with both the process and its pty.

Wrap that line at 72 characters length, taking into account that we
consider a tab as 8 characters wide.

Regards,

Vincent.
