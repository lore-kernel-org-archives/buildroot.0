From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:39:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: bump version to
 1.25.11
In-Reply-To: <20191020111525.5038-1-bernd.kuhls@t-online.de>
References: <20191020111525.5038-1-bernd.kuhls@t-online.de>
Message-ID: <20191020153936.79c689a5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 13:15:25 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch applied upstream:
> https://github.com/OpenPrinting/cups-filters/commit/1fa09312860cdee342a0afc9423c9d3c411bbbae
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ild-system-add-missing-ln-srf-script.patch | 71 -------------------
>  package/cups-filters/cups-filters.hash        |  2 +-
>  package/cups-filters/cups-filters.mk          |  2 +-
>  3 files changed, 2 insertions(+), 73 deletions(-)
>  delete mode 100644 package/cups-filters/0001-Build-system-add-missing-ln-srf-script.patch

You forgot to remove the CUPS_FILTERS_MAKE_LN_SRF_EXECUTABLE post-patch
hook, which was no longer needed. Applied after fixing this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
