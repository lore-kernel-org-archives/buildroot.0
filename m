From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:57:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/json-c: bump version to 0.14
In-Reply-To: <20200606214729.6487-1-git@chp.io>
References: <20200606214729.6487-1-git@chp.io>
Message-ID: <20200622225712.3cfaade3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 06 Jun 2020 21:47:38 +0000
Christopher Pelloux <git@chp.io> wrote:

> Notes:
> 
> - json-c now uses cmake instead of autoconf
> - This version also brings support to the much welcomed feature for
>   parsing uint64_t types
> 
> Signed-off-by: Christopher Pelloux <git@chp.io>
> ---
>  package/json-c/json-c.hash |  2 +-
>  package/json-c/json-c.mk   | 14 +++-----------
>  2 files changed, 4 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
