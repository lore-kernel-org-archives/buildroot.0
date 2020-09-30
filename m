From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:36:50 +0200
Subject: [Buildroot] [PATCH] package/elfutils: bump to version 0.181
In-Reply-To: <20200929233314.544672-1-nolange79@gmail.com>
References: <20200929233314.544672-1-nolange79@gmail.com>
Message-ID: <20200930213650.724a8c4b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Sep 2020 01:33:13 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Refreshed patch #1 and disable debuginfod.
> 
> The debuginfod tools needs to hook into serverinfrastructure,
> this currently only exists for Fedora.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  ...nable-disable-progs-configure-option.patch | 25 +++++++++----------
>  package/elfutils/elfutils.hash                | 12 ++++-----
>  package/elfutils/elfutils.mk                  |  5 +++-
>  3 files changed, 21 insertions(+), 21 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
