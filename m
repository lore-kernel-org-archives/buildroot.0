From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:44:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libaacs: bump version to 0.11.0
In-Reply-To: <20200921182803.359197-1-bernd.kuhls@t-online.de>
References: <20200921182803.359197-1-bernd.kuhls@t-online.de>
Message-ID: <20200921224412.7391761b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Sep 2020 20:28:03 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog:
> https://code.videolan.org/videolan/libaacs/-/blob/master/ChangeLog
> 
> Added patch to fix build error.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0001-read_file.h-include-sys-types.h.patch | 36 +++++++++++++++++++
>  package/libaacs/libaacs.hash                  |  4 +--
>  package/libaacs/libaacs.mk                    |  2 +-
>  3 files changed, 39 insertions(+), 3 deletions(-)
>  create mode 100644 package/libaacs/0001-read_file.h-include-sys-types.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
