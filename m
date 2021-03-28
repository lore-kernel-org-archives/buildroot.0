From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:45:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
In-Reply-To: <20210328082211.230327-1-bernd.kuhls@t-online.de>
References: <20210328082211.230327-1-bernd.kuhls@t-online.de>
Message-ID: <20210328214527.24ea6628@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 28 Mar 2021 10:22:11 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream removed x11 dependency from vaapi support:
> https://github.com/tvheadend/tvheadend/commit/ecd05a21de3075466476df97cf37ffd42c787e58
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/tvheadend.hash | 2 +-
>  package/tvheadend/tvheadend.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
