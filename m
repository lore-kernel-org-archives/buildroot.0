From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 23:48:57 +0200
Subject: [Buildroot] [PATCH v2] configs/microchip: addition of the
 sama5d27 wlsom1 ek board
In-Reply-To: <1573572263-14308-1-git-send-email-eugen.hristev@microchip.com>
References: <1573572263-14308-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20200714234857.30cf42a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Nov 2019 15:24:33 +0000
<Eugen.Hristev@microchip.com> wrote:

> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Add the new SAMA5D27 WLSOM1 Evaluation Kit with linux4sam_6.2 components.
> Update README file with new defconfigs and new packages/website
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v2:
> - added minimal (non-dev) defconfig
> - changed README to accomodate
> - added defconfigs to DEVELOPERS
> - changed u-boot and at91bootstrap to use of tarballs instead of git clone
> - Thanks Thomas for review

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
