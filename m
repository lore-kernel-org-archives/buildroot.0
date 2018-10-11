From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 17:16:49 +0200
Subject: [Buildroot] [PATCH 1/1] fwts: bump to version V18.09.00
In-Reply-To: <20180926223914.12884-1-nunes.erico@gmail.com>
References: <20180926223914.12884-1-nunes.erico@gmail.com>
Message-ID: <20181011171649.38639b77@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 00:39:14 +0200, Erico Nunes wrote:
> Build- and run-tested on x86_64 and aarch64.
> Rebased -Werror removal patch, it didn't apply anymore because one of
> the files added a license header at the top.
> Added libbsd dependency which is required since V18.08.00 for the
> "bsd/string.h" header.
> Reordered list of Config.in dependencies to match the toolchain
> requirements comment order.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  .../fwts/0001-build-do-not-use-Werror.patch   | 19 +++++++++++--------
>  package/fwts/Config.in                        |  9 ++++++---
>  package/fwts/fwts.hash                        |  2 +-
>  package/fwts/fwts.mk                          |  4 ++--
>  4 files changed, 20 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
