From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:12:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/haveged: bump to version 1.9.12
In-Reply-To: <1592848513-14831-1-git-send-email-pjtexier@koncepto.io>
References: <1592848513-14831-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200622211208.4bb3371a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 19:55:13 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This includes the following changes:
> 
> 9adede5 Bumped version to 1.9.12
> 7487642 Merge pull request #40 from PrinterFranklin/fix_memory_leak
> cbef34b fix a memory leak in havege_destroy
> 02674ae Updated ChangeLog
> 1ce2092 Update README.md
> b77e7db Create README.md
> f5bd6fa Updated version to v1.9.11
> 68b1d84 Merge branch 'master' of https://github.com/jirka-h/haveged
> fb12bb3 updated fedora.spec
> b162c91 Merge pull request #35 from eworm-de/private-tmp
> b839803 Merge pull request #34 from Chocobo1/gh_action
> 4a0a008 Replace @SBIN_DIR@ in haveged.service file with actual path
> c216a6f Moved haveged.spec to fedora.spec
> 2098470 fix ordering cycle with private tmp
> 7cd68e1 Add GitHub Actions continuous integration script
> ebe97f0 Fixed time format
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/haveged/haveged.hash | 2 +-
>  package/haveged/haveged.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
