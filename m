From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 21:36:43 +0100
Subject: [Buildroot] [PATCH 2/5 v2] package infra: do not check hashes
 when downloading from a repository
In-Reply-To: <39f9a41523a7e1f35e423bdabb722633f7dde494.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
 <39f9a41523a7e1f35e423bdabb722633f7dde494.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <550B335B.8080701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/15 13:59, Yann E. MORIN wrote:
> When downloading from a repository, we have no way to ensure the
> reproducibility of the generated archives, so we can't check the hashes.
> 
> Do not specifiy a hash file in those cases.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/pkg-download.mk | 5 -----
>  1 file changed, 5 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
