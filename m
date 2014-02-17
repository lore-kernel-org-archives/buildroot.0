From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Feb 2014 23:47:19 +0100
Subject: [Buildroot] [PATCH 05/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <c5ba824bdc6dd9631a39cf3755a9ffecdf44deab.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <c5ba824bdc6dd9631a39cf3755a9ffecdf44deab.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <53029177.3050006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/14 18:27, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
> external, pre-defined toolchains.
> 
> Also annotate those toolchain with older-than-3.0 headers.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
