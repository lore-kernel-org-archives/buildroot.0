From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 00:09:34 +0200
Subject: [Buildroot] [PATCH 1/4]
 toolchain/toolchain-external/toolchain-external-bootlin: update to
 2020.08-1 toolchains
In-Reply-To: <20201001155621.367441-1-thomas.petazzoni@bootlin.com>
References: <20201001155621.367441-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201015000934.6d936897@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  1 Oct 2020 17:56:17 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Bootlin toolchains in version 2020.08-1 have just been released, so
> let's update the toolchain-external-bootlin package to those new
> toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../Config.in.options                         | 1057 ++++++++++-------
>  .../toolchain-external-bootlin.hash           |  612 +++++-----
>  .../toolchain-external-bootlin.mk             |  306 ++---
>  3 files changed, 1071 insertions(+), 904 deletions(-)

Series applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
