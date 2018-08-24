From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:28:58 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/linux-headers: add help text
 for manual header selection
In-Reply-To: <20180823161930.18461-1-mark.corbin@embecosm.com>
References: <20180823161930.18461-1-mark.corbin@embecosm.com>
Message-ID: <20180824232858.6e43fbd3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 17:19:28 +0100, Mark Corbin wrote:
> Add kconfig help text that explains how to manually specify an
> official Linux version to use for the kernel headers.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  package/linux-headers/Config.in.host | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
