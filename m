From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 21:32:28 +0100
Subject: [Buildroot] [PATCH] skeleton: Recreate /var/run symlink
In-Reply-To: <1455135991-6491-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1455135991-6491-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <56BB9E5C.3020203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 21:26, Maxime Hadjinlian wrote:
> It was the only one with a trailing slash, it's only for coherence's
> sake.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  system/skeleton/var/run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/skeleton/var/run b/system/skeleton/var/run
> index d1a2745..84ba55b 120000
> --- a/system/skeleton/var/run
> +++ b/system/skeleton/var/run
> @@ -1 +1 @@
> -../run/
> \ No newline at end of file
> +../run
> \ No newline at end of file
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
