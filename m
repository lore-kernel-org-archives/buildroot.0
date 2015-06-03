From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 03 Jun 2015 22:59:12 +0200
Subject: [Buildroot] [PATCH 13/32 v2] package/matchbox-common: move one
 directory higher
In-Reply-To: <be877917f9d59bbe45208ca64f39c665475ff6b4.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
 <be877917f9d59bbe45208ca64f39c665475ff6b4.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <556F6AA0.9080704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 22:41, Yann E. MORIN wrote:
> We usually do not have a sub-directory for a family of related
> packages, so move matchbox packages one directory higher, so they
> all are in packages/
> 
> Also re-order packages alphabetically.
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> Notes:
>   - Arnout suggested keeping the 'source' directive in matchbox'
>     Config.in, like we do for Kodi;
>   - some typoes preventively spotted by Arnout. Thanks! :-)
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
