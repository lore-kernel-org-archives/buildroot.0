From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 15:27:51 +0100
Subject: [Buildroot] [PATCH v3 2/3] skeleton: Remove bash specific files
In-Reply-To: <1443881664-9100-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443881664-9100-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443881664-9100-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <560FE5E7.4000104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 15:14, Maxime Hadjinlian wrote:
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  system/skeleton/root/.bash_history | 0
>  system/skeleton/root/.bash_logout  | 7 -------
>  system/skeleton/root/.bash_profile | 7 -------
>  3 files changed, 14 deletions(-)
>  delete mode 100644 system/skeleton/root/.bash_history
>  delete mode 100644 system/skeleton/root/.bash_logout
>  delete mode 100644 system/skeleton/root/.bash_profile
> 
> diff --git a/system/skeleton/root/.bash_history b/system/skeleton/root/.bash_history
> deleted file mode 100644
> index e69de29..0000000
> diff --git a/system/skeleton/root/.bash_logout b/system/skeleton/root/.bash_logout
> deleted file mode 100644
> index 77ef1f9..0000000
> --- a/system/skeleton/root/.bash_logout
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# ~/.bash_logout: executed by bash(1) when login shell exits.
> -
> -# when leaving the console clear the screen to increase privacy
> -
> -case "`tty`" in
> -    /dev/tty[0-9]*) clear
> -esac
> diff --git a/system/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
> deleted file mode 100644
> index 0ee04a3..0000000
> --- a/system/skeleton/root/.bash_profile
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# .bash_profile
> -
> -umask 022
> -
> -if [ -f ~/.bashrc ]; then
> -    source ~/.bashrc
> -fi
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
