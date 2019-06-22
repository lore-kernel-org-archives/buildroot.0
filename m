From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:21:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 2.5.2
In-Reply-To: <20190622175454.28857-1-bernd.kuhls@t-online.de>
References: <20190622175454.28857-1-bernd.kuhls@t-online.de>
Message-ID: <20190622202131.4528c705@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 19:54:54 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream switched tarball to .xz
> 
> Updated license hash for COPYING after upstream commit:
> https://github.com/harfbuzz/harfbuzz/commit/8ed7655be89c658219ab702e34a79734ba0efb73
> 
> Removed license file src/hb-ucdn/COPYING after upstream commit
> https://github.com/harfbuzz/harfbuzz/commit/65392b734e38668b870b1ffcbfb4b42ec289ef58
> removed src/hb-ucdn/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/harfbuzz/harfbuzz.hash | 7 +++----
>  package/harfbuzz/harfbuzz.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
