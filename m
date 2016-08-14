From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:50:57 +0200
Subject: [Buildroot] [PATCH 8/8] package/qlibc: drop a
 musl-compatibility patch
In-Reply-To: <d4d54fc8edf86a9c69e7f1593004e698a4614bbb.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <d4d54fc8edf86a9c69e7f1593004e698a4614bbb.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <8f754e34-138a-0f79-94f8-95d15715f948@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-08-16 22:50, Yann E. MORIN wrote:
> We now always have a sys/cdefs.h, so we can drop this patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  ...l-build-by-removing-usage-of-internal-gli.patch | 59 ----------------------
>  1 file changed, 59 deletions(-)
>  delete mode 100644 package/qlibc/0004-md5-fix-musl-build-by-removing-usage-of-internal-gli.patch
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
