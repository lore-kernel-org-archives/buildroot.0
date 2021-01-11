From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:37:50 +0100
Subject: [Buildroot] [PATCH] package/wireguard-linux-compat: bump
 version to 1.0.20201221
In-Reply-To: <20210111191108.28911-1-peter@korsgaard.com>
References: <20210111191108.28911-1-peter@korsgaard.com>
Message-ID: <20210111223750.1fa138d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 20:11:08 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes a build issue with linux-rt >= 5.4.  For details, see the
> announcement:
> https://lists.zx2c4.com/pipermail/wireguard/2020-December/006210.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
>  package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
