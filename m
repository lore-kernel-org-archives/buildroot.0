From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:38:15 +0200
Subject: [Buildroot] [PATCH] liblogging: update project URL
In-Reply-To: <20180706022239.12854-1-casantos@datacom.com.br>
References: <20180706022239.12854-1-casantos@datacom.com.br>
Message-ID: <d2ead092-bf4e-2cf1-2faf-e188cf1ff03a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-18 04:22, Carlos Santos wrote:
> The original site www.liblogging.org has been taken down because of the
> new European data protection regulation (GDPR), to which it was not
> compliant.

 Makes me wonder what kind of horrific spyware was on there to warrant taking it
down...

 Applied to master, thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/liblogging/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
> index 23c3c1ad2d..a39fdf8ddc 100644
> --- a/package/liblogging/Config.in
> +++ b/package/liblogging/Config.in
> @@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBLOGGING
>  	  logging. It offers an enhanced replacement
>  	  for the syslog() call, but retains its ease of use.
>  
> -	  http://www.liblogging.org/
> +	  https://www.rsyslog.com/liblogging/
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
