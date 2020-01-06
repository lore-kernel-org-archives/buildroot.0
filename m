From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:30:08 +0100
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version cc628ee
In-Reply-To: <1578340300-4253-1-git-send-email-pjtexier@koncepto.io>
References: <1578340300-4253-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200106233008.41f0d7fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 20:51:40 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This includes the following changes:
> 
> cc628ee libuboot: wrap libuboot in extern "C" for C++
> bf6ff63 Prepare 0.2
> 3393485 Fix compiler warning
> 8f7c00a uboot_env: fix the resarch of ubi volume
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/libubootenv/libubootenv.hash | 2 +-
>  package/libubootenv/libubootenv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
