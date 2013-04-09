From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 09 Apr 2013 15:43:06 -0300
Subject: [Buildroot] [PATCH v5] wireless-regdb: new package
In-Reply-To: <1365513739-19763-1-git-send-email-dimitris@siganos.org>
References: <1365513739-19763-1-git-send-email-dimitris@siganos.org>
Message-ID: <5164613A.6010603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/09/2013 10:22 AM, Dimitrios Siganos wrote:
> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

> +++ b/package/wireless-regdb/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_WIRELESS_REGDB
> +	bool "wireless-regdb"
> +	help
> +	  Wireless regulatory database.
> +
> +	  Wireless regulatory database for CRDA. The database lists the
> +	  allowed radio frequencies for each local jurisdiction.
> +
> +	  http://linuxwireless.org/en/developers/Regulatory
> +

Stray newline here but Peter can fix that.
Thanks for taking your time respining.
Regards.
