From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:32:24 +0200
Subject: [Buildroot] [PATCH v2 1/2] minicom: add COPYING sha256 to hash
In-Reply-To: <20180831133819.127966-1-giulio.benetti@micronovasrl.com>
References: <20180831141332.2ceca29c@windsurf>
 <20180831133819.127966-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180831233224.1fc44357@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Aug 2018 15:38:18 +0200, Giulio Benetti wrote:
> In minicom package hash file lacks sha256 entry for COPYING file even if
> it is added to MINICOM_LICENSE_FILES.
> 
> Add COPYING sha256 entry to minicom.hash file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes V1->V2:
> no changes

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
