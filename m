From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Aug 2019 14:37:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
Message-ID: <20190828143750.0948e4ef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Aug 2019 15:49:59 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> The list of packages versions in Buildroot seems to be take from the master 
> branch. All these packages were updated in the next branch. I think that when 
> the next branch is active (i.e. has commits not in master), the script should 
> look there instead of master.

I have modified the logic. Now pkg-stats is run with the data from the
next branch when it exists, otherwise using the data of the master
branch. So we simply need to drop the next branch from the official Git
repo when a release is done to have pkg-stats be back in using data
from the master branch.

I have not re-generated the pkg-stats data, so it will have an effect
only tomorrow.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
