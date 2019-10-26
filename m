From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:02:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/f2fs-tools: bump to 1.13.0
In-Reply-To: <20191026112110.774941-1-grzegorz@blach.pl>
References: <20191026112110.774941-1-grzegorz@blach.pl>
Message-ID: <20191026150217.20ccceca@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 11:21:10 +0000
Grzegorz Blach <grzegorz@blach.pl> wrote:

> This release includes:
>  - enable VERITY by default on Android
>  - introduce some preen mode in fsck.f2fs
>  - add f2fs_io tool
>  - add casefolding support
> 
> And, there are lots of bug fixes.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/f2fs-tools/f2fs-tools.hash | 2 +-
>  package/f2fs-tools/f2fs-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
