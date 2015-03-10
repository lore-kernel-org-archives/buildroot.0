From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Mar 2015 08:43:12 -0300
Subject: [Buildroot] [PATCH v2 1/4] package/unixodbc: new package
In-Reply-To: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <54FED8D0.5020406@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/2015 01:49 PM, Bernd Kuhls wrote:

> --- /dev/null
> +++ b/package/unixodbc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_UNIXODBC
> +	bool "unixodbc"
> +	help
> +	  The unixODBC Project goals are to develop and promote unixODBC
> +	  to be the definitive standard for ODBC on non MS Windows platforms.
> +
> +	  http://www.unixodbc.org

Hi.
According to my tests it needs threads, you'll need to propagate that
dependency upwards to php-pdo-unixdobc as well.
Other than that it looks good.
Regards.
