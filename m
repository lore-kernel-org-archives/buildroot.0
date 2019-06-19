From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Jun 2019 12:39:41 +0300
Subject: [Buildroot] [PATCH] toolchain: bump ARC tools to arc-2019.03
 release
In-Reply-To: <20190619092532.40543-1-Evgeniy.Didin@synopsys.com>
References: <20190619092532.40543-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20190619093941.zo6wrxn6zcyqtqs6@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Evgeniy,

On Wed, Jun 19, 2019 at 12:25:32PM +0300, Evgeniy Didin wrote:
> This commit finally bumps ARC tools to the most recent arc-2018.09 release version.

arc-2018.09? Shouldn't that be arc-2019.03?

> ARC GNU tools of version arc-2018.09 bring some quite significant changes 

Ditto.

baruch

>  like:
>  * Binutils v2.32.51.20190308 with additional ARC patches
>  * GCC 8.3.1 with additional ARC patches
>  * glibc 2.29 with additional ARC patches
> More information on this release could be found here:
>  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2019.03-release
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
