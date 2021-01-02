From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 10:43:01 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: add jitterentropy
 library option
In-Reply-To: <20201208145338.29199-1-yegorslists@googlemail.com>
References: <20201208145338.29199-1-yegorslists@googlemail.com>
Message-ID: <20210102104301.5c3bc96a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Dec 2020 15:53:38 +0100
yegorslists--- via buildroot <buildroot@busybox.net> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add a menu entry to enable/disable jitterentropy library. Make it
> enabled by default to preserve the old behavior.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/rng-tools/Config.in    | 12 +++++++++++-
>  package/rng-tools/rng-tools.mk |  9 ++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
