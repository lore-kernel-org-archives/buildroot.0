From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:42:26 +0200
Subject: [Buildroot] [PATCH] trinity: add optional dependency on
 btrfs-progs
In-Reply-To: <baba62bac89ef2a49b0206dcfeec2b9b249a4d3a.1492296807.git.baruch@tkos.co.il>
References: <baba62bac89ef2a49b0206dcfeec2b9b249a4d3a.1492296807.git.baruch@tkos.co.il>
Message-ID: <20170416104226.193c8b46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 01:53:27 +0300, Baruch Siach wrote:
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> The context of this patch depends on
> http://patchwork.ozlabs.org/patch/751102/.
> ---
>  package/trinity/trinity.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
