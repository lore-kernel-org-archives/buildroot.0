From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:47:24 +0100
Subject: [Buildroot] [PATCH] package/lualdap: bump to version 1.2.6
In-Reply-To: <20210317101234.1775425-1-francois.perrad@gadz.org>
References: <20210317101234.1775425-1-francois.perrad@gadz.org>
Message-ID: <20210320224724.35ef7e55@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Mar 2021 11:12:34 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> - switch to luarocks infrastructure
> - support Lua 5.4
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lualdap/Config.in    |  7 +++----
>  package/lualdap/lualdap.hash |  6 +++---
>  package/lualdap/lualdap.mk   | 30 +++++-------------------------
>  3 files changed, 11 insertions(+), 32 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
