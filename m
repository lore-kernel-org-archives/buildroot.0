From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:06:38 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/libtirpc: bump to version
 0.3.2
In-Reply-To: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437633506-3224-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150723230638.5604d1c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 23 Jul 2015 08:38:24 +0200, J?rg Krause wrote:
> Bump version, update hash and update patch.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v1 -> v2:
>   - None
> ---
>  ...sable-parts-of-TIRPC-requiring-NIS-support.patch | 21 +++++++++++++--------
>  package/libtirpc/libtirpc.hash                      |  4 ++--
>  package/libtirpc/libtirpc.mk                        |  2 +-
>  3 files changed, 16 insertions(+), 11 deletions(-)

All three applied. In the last patch, I'm not too happy with the
removed lines being commented instead of just being removed, but OK.

Our stack of patches on libtirpc is still huge though :-/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
