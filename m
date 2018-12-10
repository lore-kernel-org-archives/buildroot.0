From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:47:38 +0100
Subject: [Buildroot] [PATCH v2] utils/scanpypi: import third party
 modules after the standard ones
In-Reply-To: <20181210075234.9168-1-yegorslists@googlemail.com>
References: <20181210075234.9168-1-yegorslists@googlemail.com>
Message-ID: <20181210114738.03478ee4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Dec 2018 08:52:34 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Move imports from six package after the standard modules. Resolves
> pylint warnings.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
> 	- change prefix to utils/scanpypi and add SoB (Thomas Petazzoni)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
