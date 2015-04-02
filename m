From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 02 Apr 2015 23:38:50 +0200
Subject: [Buildroot] [PATCH 2/7 v4] package infra: do not check hashes
 when downloading from a repository
In-Reply-To: <b172905fe4ddd1944cc14df21cc33d527c755a80.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
 <b172905fe4ddd1944cc14df21cc33d527c755a80.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <551DB6EA.3050209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/04/15 00:15, Yann E. MORIN wrote:
> When downloading from a repository, we have no way to ensure the
> reproducibility of the generated archives, so we can't check the hashes.
> 
> Do not specifiy a hash file in those cases.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 And now I also reviewed the manual update.

 Regards,
 Arnout

> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> Changes v2 -> v3:
>   - add blurb in the manual  (Arnout)
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
