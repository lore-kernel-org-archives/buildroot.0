From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:36:41 +0200
Subject: [Buildroot] [PATCH 06/27] package/stress-ng: re-enable package
 on microblaze
In-Reply-To: <20190614210346.121013-7-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-7-giulio.benetti@micronovasrl.com>
Message-ID: <20190619143641.4cdf505e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:25 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Package stress-ng has a dependency to keyutils, but keyutils has been
> re-enabled with previous patch. Re-enable package by removing 'depends
> on !BR_microblaze' from stress-ng Config.in.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/stress-ng/Config.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
