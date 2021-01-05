From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 22:39:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] perl: Add option to enable threads
In-Reply-To: <20200121192916.63356-1-clayton.shotwell@rockwellcollins.com>
References: <20200121192916.63356-1-clayton.shotwell@rockwellcollins.com>
Message-ID: <20210105223938.6632c96d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jan 2020 13:29:16 -0600
Clayton Shotwell <clayton.shotwell@rockwellcollins.com> wrote:

> From: Hector Kesari <hector.kesari@rockwellcollins.com>
> 
> Add config option for Perl to enable threads usage.
> 
> Signed-off-by: Hector Kesari <hector.kesari@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> ---
> Changes v1 -> v2:
>   - Changed references of PERL to Perl
>   - Added a warning about using Perl threads
> ---
>  package/perl/Config.in | 13 +++++++++++++
>  package/perl/perl.mk   |  4 ++++
>  2 files changed, 17 insertions(+)

Even though Arnout was not sure, this patch has been around for a long
time, the complexity is very low, so I applied to master with a few
tweaks.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
