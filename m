From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jul 2016 09:28:10 +0200
Subject: [Buildroot] [PATCH 01/24 v2] package/skeleton: remove useless
 .empty file
In-Reply-To: <ff7368e61707c220a37c746a171c68300445f834.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <ff7368e61707c220a37c746a171c68300445f834.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <552f40c8-4446-98fc-8999-0f75a8c3bda1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-06-16 21:07, Yann E. MORIN wrote:
> We now have a real file in that directory, so we do not need a .empty
> placeholder.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  system/skeleton/etc/network/if-pre-up.d/.empty | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  delete mode 100644 system/skeleton/etc/network/if-pre-up.d/.empty
> 
> diff --git a/system/skeleton/etc/network/if-pre-up.d/.empty b/system/skeleton/etc/network/if-pre-up.d/.empty
> deleted file mode 100644
> index e69de29..0000000
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
