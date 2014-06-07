From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Jun 2014 12:24:30 +0200
Subject: [Buildroot] [PATCH 1/1] fetchmail: Update project URL after
 shutdown of berlios.de
In-Reply-To: <1402065903-2779-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402065903-2779-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140607122430.25898775@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  6 Jun 2014 16:45:03 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/fetchmail/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
> index 3419821..1eb0359 100644
> --- a/package/fetchmail/Config.in
> +++ b/package/fetchmail/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_FETCHMAIL
>  	  Fetchmail - the mail-retrieval daemon
>  	  Client daemon to move mail from POP and IMAP to your local computer
>  
> -	  http://sourceforge.net/projects/fetchmail/
> +	  http://www.fetchmail.info/

How is moving from SourceForge to some other place related to the
shutdown of berlios.de?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
