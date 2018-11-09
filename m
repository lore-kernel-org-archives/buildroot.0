From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:24:49 +0100
Subject: [Buildroot] [PATCH] package/meson: bump to version 0.47.2
In-Reply-To: <20181105000518.32336-1-joerg.krause@embedded.rocks>
References: <20181105000518.32336-1-joerg.krause@embedded.rocks>
Message-ID: <20181109222449.62f55771@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Nov 2018 01:05:18 +0100, J?rg Krause wrote:
> Note, that there is already a patch [1] to bump the version to 0.48.1.
> However, the bump to version 0.48.x has some unresolved issues.
> 
> In the meantime, until the issue with 0.48 is resolved, bump to latest
> version of the 0.47 branch.
> 
> [1] http://patchwork.ozlabs.org/patch/986260/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
