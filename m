From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:52:37 +0200
Subject: [Buildroot] [PATCH 1/5] linux: automatically set
 CONFIG_PERF_EVENTS when perf is enabled
In-Reply-To: <20180704070739.7259-2-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
 <20180704070739.7259-2-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704215237.39ca1527@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jul 2018 09:07:35 +0200, Thomas De Schampheleire wrote:
> From: Jan Heylen <jan.heylen@nokia.com>
> 
> Perf profiling cannot be used if CONFIG_PERF_EVENTS is not enabled in the
> kernel configuration. Similar to other tools, like ktap, we can enable the
> right options automatically.
> 
> Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  linux/linux.mk                | 2 ++
>  package/linux-tools/Config.in | 8 +++++---
>  2 files changed, 7 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
