From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Dec 2015 09:48:15 +0100
Subject: [Buildroot] [PATCH 1/2] wine: Make the sane-config patch
 obsolete by using configure flags
In-Reply-To: <5665EE7A.1080409@dawncrow.de>
References: <5665EE7A.1080409@dawncrow.de>
Message-ID: <20151208094815.7200558c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?,

On Mon, 7 Dec 2015 21:39:22 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/wine/0003-sane-config-fix.patch | 21 ---------------------
>  package/wine/wine.mk                    |  3 ++-
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 package/wine/0003-sane-config-fix.patch

IMO, this is not the good choice. The patch should be kept and
submitted upstream. There is absolutely no reason for upstream to
reject the patch: it simply *adds* the possibility of passing a custom
sane-config path through SANE_CONFIG, without changing *anything* to
the existing behavior if SANE_CONFIG is not used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
