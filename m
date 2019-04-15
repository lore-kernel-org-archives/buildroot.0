From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 15 Apr 2019 07:36:04 -0300
Subject: [Buildroot] [PATCH 1/1] package/busybox: fix S0{1sys,
 2k}logd indentation
In-Reply-To: <20190415083605.32138-1-fontaine.fabrice@gmail.com>
References: <20190415083605.32138-1-fontaine.fabrice@gmail.com>
Message-ID: <A8B0E57C-FA77-4ACF-A0DD-A13C9C3224F6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What?s wrong with the current indentation?

(Sorry for the top-posting. Answering from the phone).

Em 15 de abr de 2019, ?(s) 05:36, Fabrice Fontaine <fontaine.fabrice@gmail.com> escreveu:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> package/busybox/S01syslogd | 8 ++++----
> package/busybox/S02klogd   | 8 ++++----
> 2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/busybox/S01syslogd b/package/busybox/S01syslogd
> index 6e642a678a..15006bc06f 100644
> --- a/package/busybox/S01syslogd
> +++ b/package/busybox/S01syslogd
> @@ -44,12 +44,12 @@ restart() {
> }
> 
> case "$1" in
> -        start|stop|restart)
> +    start|stop|restart)
>        "$1";;
>    reload)
>        # Restart, since there is no true "reload" feature.
>        restart;;
> -        *)
> -                echo "Usage: $0 {start|stop|restart|reload}"
> -                exit 1
> +    *)
> +        echo "Usage: $0 {start|stop|restart|reload}"
> +        exit 1
> esac
> diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
> index a4200cfb34..0677e1e5ca 100644
> --- a/package/busybox/S02klogd
> +++ b/package/busybox/S02klogd
> @@ -44,12 +44,12 @@ restart() {
> }
> 
> case "$1" in
> -        start|stop|restart)
> +    start|stop|restart)
>        "$1";;
>    reload)
>        # Restart, since there is no true "reload" feature.
>        restart;;
> -        *)
> -                echo "Usage: $0 {start|stop|restart|reload}"
> -                exit 1
> +    *)
> +        echo "Usage: $0 {start|stop|restart|reload}"
> +        exit 1
> esac
> -- 
> 2.20.1
> 
