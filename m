From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:42:03 +0200
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: add version 5.9
In-Reply-To: <20201012083317.11732-1-michael@walle.cc>
References: <20201012083317.11732-1-michael@walle.cc>
Message-ID: <20201012224203.0de3ce19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Mon, 12 Oct 2020 10:33:16 +0200
Michael Walle <michael@walle.cc> wrote:

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  linux/Config.in                                     |  4 ++--
>  linux/linux.hash                                    |  1 +
>  package/linux-headers/Config.in.host                | 13 +++++++++++--
>  toolchain/Config.in                                 |  5 +++++
>  .../toolchain-external-custom/Config.in.options     |  6 +++++-
>  5 files changed, 24 insertions(+), 5 deletions(-)

Applied to master, thanks. However, it is not normal that your
defconfig uses just the "latest kernel version". We normally want all
our defconfigs to use a fixed and well-defined kernel versions so that
we are sure that what our users build is a kernel version that was
tested by the person who contributed the defconfig.

Could you send another patch to adjust your defconfig accordingly ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
