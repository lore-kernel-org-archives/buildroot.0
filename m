From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:41:12 +0200
Subject: [Buildroot] [PATCH 5/8] package/bcusdk: drop a
 musl-compatibility patch
In-Reply-To: <fd94bb483d5538c48b7aeb03d65e3d4c8db2dcb9.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <fd94bb483d5538c48b7aeb03d65e3d4c8db2dcb9.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <a23774c4-0eca-0e71-298c-b4ca200d50e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-08-16 22:49, Yann E. MORIN wrote:
> We now always have a sys/cdefs.h, so we can drop this patch.

 And renumber the remaining patch.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Note that the patch was sent upstream, but it seems never acted upon.
> ---
>  ...t-use-the-non-standard-sys-cdefs.h-header.patch | 48 ----------------------
>  ...d_set-requires-inclusion-of-sys-select.h.patch} |  0
>  2 files changed, 48 deletions(-)
>  delete mode 100644 package/bcusdk/0001-Do-not-use-the-non-standard-sys-cdefs.h-header.patch
>  rename package/bcusdk/{0002-fd_set-requires-inclusion-of-sys-select.h.patch => 0001-fd_set-requires-inclusion-of-sys-select.h.patch} (100%)
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
