From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:23:30 +0200
Subject: [Buildroot] [PATCH] package/linux-serial-test: bump version
In-Reply-To: <20210413204840.25514-1-michael@walle.cc>
References: <20210413204840.25514-1-michael@walle.cc>
Message-ID: <20210419232330.60c03183@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Apr 2021 22:48:40 +0200
Michael Walle <michael@walle.cc> wrote:

> Give this package some love and update to the newest version. There are
> no released versions, though. Therefore, use the latest commit.
> 
> Notable changes:
>  - RS485 support fixes and features
>  - internal loopback support
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  package/linux-serial-test/linux-serial-test.hash | 2 +-
>  package/linux-serial-test/linux-serial-test.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
