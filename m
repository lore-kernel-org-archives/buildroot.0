From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:47:54 +0200
Subject: [Buildroot] [PATCH] poco: disable fpenvironment for soft
 floating point configuration
In-Reply-To: <20181010082214.1815-1-yegorslists@googlemail.com>
References: <20181010082214.1815-1-yegorslists@googlemail.com>
Message-ID: <20181010104754.4e912868@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 10:22:14 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Many platforms don't provide all FPU features needed by Poco when
> configured for soft floating point in their fenv.h header. So
> disable fpenvironment for this configuration to avoid build breakage.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/poco/poco.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
