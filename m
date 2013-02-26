From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Feb 2013 18:45:11 +0100
Subject: [Buildroot] [PATCH 04/11] working-with: board support
In-Reply-To: <bd4236ff40f9132d14f2f6610588847e92df93dc.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
 <bd4236ff40f9132d14f2f6610588847e92df93dc.1361827174.git.s.martin49@gmail.com>
Message-ID: <512CF4A7.1030802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/13 22:31, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes since v1:
> * simplify cross-ref (Arnout)
> ---
>   docs/manual/working-with.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
> index a57169c..4432b54 100644
> --- a/docs/manual/working-with.txt
> +++ b/docs/manual/working-with.txt
> @@ -25,5 +25,5 @@ interested in hacking it to add:
>
>   * new packages: refer to the xref:adding-packages[Developer guide]
>
> -* new board support: refer to the xref:customize-store[], more specifically
> -  xref:customize-store-board-support[].
> +* new board support: refer to the
> +  xref:customize-store-board-support[Developer guide].
>

  Could you merge this with patch 1/11 (adding your own SoB of course)?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
