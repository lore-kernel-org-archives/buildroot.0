From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:18:40 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: Opt install
 fit_check_sign
In-Reply-To: <20190410191757.29525-1-sam.voss@rockwellcollins.com>
References: <20190410191757.29525-1-sam.voss@rockwellcollins.com>
Message-ID: <20190411081840.4d9c1565@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Apr 2019 14:17:57 -0500
Sam Voss <sam.voss@rockwellcollins.com> wrote:

> Add option to install fit_check_sign to target for fit image validation.
> 
> This will allow a fit image to have its signature and hashes validated
> from linux, assuming a device-tree of keys (the same as which is in
> u-boot) is available.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> ---
>  package/uboot-tools/Config.in      | 9 +++++++++
>  package/uboot-tools/uboot-tools.mk | 7 +++++++
>  2 files changed, 16 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
