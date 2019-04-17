From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2019 23:34:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: fix S0{1sys,
 2k}logd indentation
In-Reply-To: <20190416122449.12432-1-fontaine.fabrice@gmail.com>
References: <20190416122449.12432-1-fontaine.fabrice@gmail.com>
Message-ID: <be020824-d35e-9f55-0d6c-44e282611289@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/04/2019 14:24, Fabrice Fontaine wrote:
> Don't mix spaces and tabs, only use tabs
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/sysklogd/S01syslogd | 10 +++++-----
>  package/sysklogd/S02klogd   | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/package/sysklogd/S01syslogd b/package/sysklogd/S01syslogd
> index d0951f0235..2603632893 100644
> --- a/package/sysklogd/S01syslogd
> +++ b/package/sysklogd/S01syslogd
> @@ -54,9 +54,9 @@ reload() {
>  }
>  
>  case "$1" in
> -        start|stop|restart|reload)
> -                "$1";;
> -        *)
> -                echo "Usage: $0 {start|stop|restart|reload}"
> -                exit 1
> +	start|stop|restart|reload)
> +		"$1";;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
>  esac
> diff --git a/package/sysklogd/S02klogd b/package/sysklogd/S02klogd
> index 93f39e1f0e..ba728aa99a 100644
> --- a/package/sysklogd/S02klogd
> +++ b/package/sysklogd/S02klogd
> @@ -57,9 +57,9 @@ reload() {
>  }
>  
>  case "$1" in
> -        start|stop|restart|reload)
> -                "$1";;
> -        *)
> -                echo "Usage: $0 {start|stop|restart|reload}"
> -                exit 1
> +	start|stop|restart|reload)
> +		"$1";;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
>  esac
> 
