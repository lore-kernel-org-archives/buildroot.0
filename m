From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 21:51:11 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/cog: depend on libxkbcommon
In-Reply-To: <20200406174205.25939-1-cturner@igalia.com>
References: <20200406174205.25939-1-cturner@igalia.com>
Message-ID: <20200406215111.61db40b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Apr 2020 18:42:03 +0100
Charlie Turner <cturner@igalia.com> wrote:

> The always-built FDO backend relies on this.
> 
> Signed-off-by: Charlie Turner <cturner@igalia.com>
> ---
>  package/cog/Config.in | 1 +
>  package/cog/cog.mk    | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Thanks, series applied. There was a minor formatting issue in PATCH
3/3, where the "default y" line was not properly indented, which was
detected by "make check-package".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
