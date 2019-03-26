From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 22:26:52 +0100
Subject: [Buildroot] [PATCH 2/2] configs/lego_ev3_defconfig: enable
 brickd by default
In-Reply-To: <20190223010454.7335-2-david@lechnology.com>
References: <20190223010454.7335-1-david@lechnology.com>
 <20190223010454.7335-2-david@lechnology.com>
Message-ID: <20190326222652.2e256f2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Feb 2019 19:04:54 -0600
David Lechner <david@lechnology.com> wrote:

> This enables the brickd package by default on LEGO MINDSTORM EV3. This
> program is important because it shuts down the system on low battery.
> Without this, rechargeable batteries could be damaged.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  configs/lego_ev3_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
