From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:54:36 +0100
Subject: [Buildroot] [PATCH v3] configs/atmel: update u-boot-at91 and
 bootstrap to tarballs
In-Reply-To: <1575459437-7302-1-git-send-email-eugen.hristev@microchip.com>
References: <1575459437-7302-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <20191205225436.436a68ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Dec 2019 11:37:47 +0000
<Eugen.Hristev@microchip.com> wrote:

> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Use custom tarballs for U-boot-at91 and at91bootstrap instead
> of cloning the repositories.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
> Changes in v3:
> - wrong call to github function for sama5d3xek, fixed

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
