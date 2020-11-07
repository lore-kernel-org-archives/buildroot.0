From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 14:07:57 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/rhash: bump version to
 1.4.0
In-Reply-To: <20201106202632.2424688-1-bernd.kuhls@t-online.de>
References: <20201106202632.2424688-1-bernd.kuhls@t-online.de>
Message-ID: <20201107140757.3e4ad561@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Nov 2020 21:26:31 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Project switched license to BSD Zero Clause License:
> https://github.com/rhash/RHash/commit/007a303dacb1ad27fb64e2133dfb8b4e28428af2
> 
> Add RHASH_CONFIGURE_CMDS after upstream added a configure script:
> https://github.com/rhash/RHash/commit/cdaf43862229fb0f10d2b6b7448bcded2ef8edde
> 
> Make target install-headers was renamed to install-lib-headers:
> https://github.com/rhash/RHash/commit/5184f57ed8c8a3d3ad66d789429bd8d1afc012ff
> 
> Make target install-shared was removed, use build-install-binary
> instead:
> https://github.com/rhash/RHash/commit/cdaf43862229fb0f10d2b6b7448bcded2ef8edde
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rhash/rhash.hash |  9 ++++-----
>  package/rhash/rhash.mk   | 32 +++++++++++++++++++++-----------
>  2 files changed, 25 insertions(+), 16 deletions(-)

Applied to next, thanks. Thanks a lot for the detailed commit log
describing the different aspect of the changes. Very useful!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
