From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Oct 2014 21:11:54 +0200
Subject: [Buildroot] [PATCH 1/3] skeleton/etc/profile: remove
 /usr/bin/X11 from PATH
In-Reply-To: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413761457-25565-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54455E7A.7090308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/10/14 01:30, Gustavo Zacarias wrote:
> That directory has been unused for ages so remove it.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  system/skeleton/etc/profile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
> index 31d3180..640f6f1 100644
> --- a/system/skeleton/etc/profile
> +++ b/system/skeleton/etc/profile
> @@ -5,7 +5,6 @@ export PATH=\
>  /sbin:\
>  /usr/bin:\
>  /usr/sbin:\
> -/usr/bin/X11:\
>  /usr/local/bin
>  
>  # If running interactively, then:
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
