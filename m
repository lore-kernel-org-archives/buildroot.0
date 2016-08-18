From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:25:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/lldpd: explicit optional
 dependencies
In-Reply-To: <1471554082-24303-2-git-send-email-yann.morin.1998@free.fr>
References: <1471554082-24303-1-git-send-email-yann.morin.1998@free.fr>
 <1471554082-24303-2-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160818232535.236eedda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 23:01:22 +0200, Yann E. MORIN wrote:
> check and valgrind are optional depenencies of lldpd, so we must depend
> on them when either is enabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - add optional dependency on valgrind  (Arnout)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
