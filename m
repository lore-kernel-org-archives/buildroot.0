From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 07:46:44 +0100
Subject: [Buildroot] [PATCH 2/9] manual: fix cross-refs
In-Reply-To: <e90370a2ea8deb23fd0d2c058f251d702f6bb783.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
 <e90370a2ea8deb23fd0d2c058f251d702f6bb783.1360795941.git.s.martin49@gmail.com>
Message-ID: <511C8854.7070806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 23:59, Samuel Martin wrote:
> diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
> index b69d1e2..a57169c 100644
> --- a/docs/manual/working-with.txt
> +++ b/docs/manual/working-with.txt
> @@ -25,4 +25,5 @@ interested in hacking it to add:
>
>   * new packages: refer to the xref:adding-packages[Developer guide]
>
> -* new board support: refer to the xref:board-support[Developer guide]
> +* new board support: refer to the xref:customize-store[], more specifically
> +  xref:customize-store-board-support[].

  I haven't checked, but doesn't this render to something like "refer to 
the 3.4, more specifically 3.7"? Why not just:

* new board support: refer to the
xref:customize-store-board-support[Developer guide].

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
