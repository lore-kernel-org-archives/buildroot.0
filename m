From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:48:22 +0200
Subject: [Buildroot] [PATCH 6/8] package/libsepol: drop a
 musl-compatibility patch
In-Reply-To: <fb5da03c6a32c50fa599ba4b401e536b39636b43.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <fb5da03c6a32c50fa599ba4b401e536b39636b43.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <33a63dac-cc92-2cd4-337f-ccf544b60d21@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-08-16 22:49, Yann E. MORIN wrote:
> We now always have a sys/cdefs.h, so we can drop this patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 After carefully checking that the removed patch doesn't do anything other than
cdefs.h and __BEGIN_DECLS:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/libsepol/0005-replace-cdefs.patch | 1074 -----------------------------
>  1 file changed, 1074 deletions(-)
>  delete mode 100644 package/libsepol/0005-replace-cdefs.patch
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
