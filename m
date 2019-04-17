From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2019 23:34:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: fix S01rsyslogd
 indentation
In-Reply-To: <20190416121338.10562-1-fontaine.fabrice@gmail.com>
References: <20190416121338.10562-1-fontaine.fabrice@gmail.com>
Message-ID: <4c6c655e-9275-0592-2602-a76dfcd9ff2b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/04/2019 14:13, Fabrice Fontaine wrote:
> Don't mix spaces and tabs, only use tabs
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/rsyslog/S01rsyslogd | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rsyslog/S01rsyslogd b/package/rsyslog/S01rsyslogd
> index e9922d932d..78421876de 100644
> --- a/package/rsyslog/S01rsyslogd
> +++ b/package/rsyslog/S01rsyslogd
> @@ -41,13 +41,13 @@ restart() {
>  }
>  
>  case "$1" in
> -        start|stop|restart)
> +	start|stop|restart)
>  		"$1";;
>  	reload)
>  		# Restart, since there is no true "reload" feature (does not
>  		# reconfigure/restart on SIGHUP, just closes all open files).
>  		restart;;
> -        *)
> -                echo "Usage: $0 {start|stop|restart|reload}"
> -                exit 1
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
>  esac
> 
