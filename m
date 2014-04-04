From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 18:43:02 +0200
Subject: [Buildroot] [PATCH 04/20] package/libopenvg: rename the _HAS
 and _PROVIDES variables
In-Reply-To: <c858f23604349c75cf3657dbd960a220a1593e01.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <c858f23604349c75cf3657dbd960a220a1593e01.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <533EE116.7060609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/14 21:27, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The basic rule for a package is to have its options named
> after the package name. There is no reason this should not
> also be the case for virtual packages.
> 
> Besides, renaming the package will allow us to switch libopenvg to use
> the soon-to-be-introduced virtual-package infrastructure.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


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
