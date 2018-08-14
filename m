From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 14:04:41 +0200
Subject: [Buildroot] [PATCH 1/1] htop: bump to version 2.2.0
In-Reply-To: <20180813193028.8042-1-joseph.kogut@gmail.com>
References: <20180813193028.8042-1-joseph.kogut@gmail.com>
Message-ID: <20180814140441.7cce3de0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 12:30:28 -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to next, thanks!

> Romain, the patch from February [1] for opening files in binary mode no longer
> applies with this release. Can you confirm whether or not such a workaround is
> still necessary?

Upstream commit
https://github.com/hishamhm/htop/commit/7cfaa9dede0f7f711a0fb961559e9629e7c7a259
seems to be there to fix the same problem, and it is part of 2.2.0.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
