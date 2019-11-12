From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 21:52:04 +0100
Subject: [Buildroot] [PATCH v2 1/1] arch/config.in.arc: Introduce the
 ARC optimized hs38 config
In-Reply-To: <20191112153443.15715-2-vgupta@synopsys.com>
References: <20191112153443.15715-1-vgupta@synopsys.com>
 <20191112153443.15715-2-vgupta@synopsys.com>
Message-ID: <20191112215204.0ea65eb9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Nov 2019 07:34:43 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> This corresponds to -mcu=hs38 with mpy-option=9 (64-bit multiplier)
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> Changes since v1
>  - Retained BR2_hs38 build semantics (dropped BR2_archs)
>  - Introduced BR2_hs38_64mpy for generating double multiply instructions
> ---
>  arch/Config.in.arc | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
