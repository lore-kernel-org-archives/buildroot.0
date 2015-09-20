From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:05:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/shairport-sync: bump to
 version 2.4
In-Reply-To: <1441694983-3818-1-git-send-email-joerg.krause@embedded.rocks>
References: <1441694983-3818-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150920150551.02429e5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue,  8 Sep 2015 08:49:43 +0200, J?rg Krause wrote:
> Version 2.4 of shairport-sync introduces new optional features (metadata,
> stdout, pipe) which we enable by default. The impact on the binary size is
> about 18 kB (110 kB vs 92 kB) for an ARM target.
> 
> Also add a new dependency to libconfig and install the default config script.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v1 -> v2:
>  * Add missing dependency libconfig (Baruch)
> ---
>  package/shairport-sync/Config.in         |  1 +
>  package/shairport-sync/shairport-sync.mk | 11 ++++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
