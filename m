From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:39:57 +1300
Subject: [Buildroot] [PATCH v2 2/2] package/ortp: bump version to 0.27.0
In-Reply-To: <20170122210021.9463-2-joerg.krause@embedded.rocks>
References: <20170122210021.9463-1-joerg.krause@embedded.rocks>
 <20170122210021.9463-2-joerg.krause@embedded.rocks>
Message-ID: <20170124223957.281846fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jan 2017 22:00:21 +0100, J?rg Krause wrote:
> ortp now depends on bctoolbox. Note, that bctoolbox is added by the
> first commit of this series.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v1 -> v2:
>  * add dependency on bctoolbox
> ---
>  package/ortp/Config.in | 1 +
>  package/ortp/ortp.hash | 2 +-
>  package/ortp/ortp.mk   | 3 ++-
>  3 files changed, 4 insertions(+), 2 deletions(-)

I propagated the C++ dependency of bctoolbox to ortp and its reverse
dependencies and applied, thanks!

BTW, the ortp package is not listed in the DEVELOPERS file. If you're
using it, would you agree to "adopt" it and be listed in the DEVELOPERS
file for it?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
