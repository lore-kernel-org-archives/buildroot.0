From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:37:22 +0100
Subject: [Buildroot] [PATCH] directfb: add gfx-state initialisation
In-Reply-To: <2c18997f-f4da-4ed8-afd6-b9e7e1c6e4ad@EXDRUEARSGC008.eq1sgc.local>
References: <2c18997f-f4da-4ed8-afd6-b9e7e1c6e4ad@EXDRUEARSGC008.eq1sgc.local>
Message-ID: <20170220213722.69d72068@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Feb 2017 11:31:24 +0100, Philippe Reynes wrote:
> The patch 0006-fix-client-gfx_state-initialisation.patch
> add the initialisation for the variable gfx-state.
> 
> This patch was provided by the community and it is already
> integrated in OpenEmbedded.
> 
> Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
> ---
>  .../0006-fix-client-gfx_state-initialisation.patch |   38 ++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/directfb/0006-fix-client-gfx_state-initialisation.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
