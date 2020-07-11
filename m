From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 00:00:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/jq: bump version to a17dd32
In-Reply-To: <20200705182845.42885-1-lylejfranklin@gmail.com>
References: <20200705182845.42885-1-lylejfranklin@gmail.com>
Message-ID: <20200712000021.552c4f8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Jul 2020 14:28:45 -0400
lylejfranklin at gmail.com wrote:

> From: Lyle Franklin <lylejfranklin@gmail.com>
> 
> - Bumps jq package to latest to fix seg fault errors
> - https://github.com/stedolan/jq/issues/2003
> - I saw this on ARM64 compiled with uclibc, issue mentions MIPS, so
>   might only be an issue for non-x86
> 
> Signed-off-by: Lyle Franklin <lylejfranklin@gmail.com>
> ---
>  package/jq/jq.hash | 2 +-
>  package/jq/jq.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master with a simplified commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
