From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:22:22 +0200
Subject: [Buildroot] [PATCH] dtc: Fix segfault reading powernv device
 tree
In-Reply-To: <20180918035750.17651-1-joel@jms.id.au>
References: <20180918035750.17651-1-joel@jms.id.au>
Message-ID: <20180918212222.5cd999b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 13:27:50 +0930, Joel Stanley wrote:
> When running this command on a powernv machine, dtc crashes:
> 
>  dtc -f -I fs -O dts /sys/firmware/devicetree
> 
> Upstream has fixed the segfault but have not made a release yet so we
> add the patch for now.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  ...001-Kill-bogus-TYPE_BLOB-marker-type.patch | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 package/dtc/0001-Kill-bogus-TYPE_BLOB-marker-type.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
