From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 18:41:58 +0200
Subject: [Buildroot] [PATCH 03/20] package/libopenmax: rename the _HAS
 and _PROVIDES variables
In-Reply-To: <fc5999e61696d0971e6051f72fa25d544af66b87.1394482605.git.yann.morin.1998@free.fr>
References: <cover.1394482605.git.yann.morin.1998@free.fr>
 <fc5999e61696d0971e6051f72fa25d544af66b87.1394482605.git.yann.morin.1998@free.fr>
Message-ID: <533EE0D6.5070601@mind.be>
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
> Besides, this will allow us to switch libopenmax to use the
> soon-to-be-introduced virtual-package infrastructure.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Mike Zick <minimod@morethan.org>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

 This one is still correct so

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(but just to be safe, use automated conversion instead of applying the
patch).


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
