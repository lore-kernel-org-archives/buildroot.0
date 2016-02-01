From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Feb 2016 19:19:41 +0100
Subject: [Buildroot] [PATCH] gitignore: ignore vim temporary files
In-Reply-To: <1454336730-18001-1-git-send-email-s.martin49@gmail.com>
References: <1454336730-18001-1-git-send-email-s.martin49@gmail.com>
Message-ID: <56AFA1BD.4000600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 15:25, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index bb02d9f..346b5df 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -13,3 +13,4 @@
>  *.rej
>  *~
>  *.pyc
> +*.swp
> 

 Actually, *.swp and *~ should be in the global excludes file which is
configured with core.excludesfile. Otherwise there are probably a bunch of other
patterns we could also add.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
