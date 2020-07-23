From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 16:27:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/gettext-tiny: bump to version
 0.3.2
In-Reply-To: <20200722145417.2195-2-heiko.thiery@gmail.com>
References: <20200722145417.2195-1-heiko.thiery@gmail.com>
 <20200722145417.2195-2-heiko.thiery@gmail.com>
Message-ID: <20200723162701.6abb1f2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jul 2020 16:53:50 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> - Adapt license hash
>   (minor additions in LICENSE file about files in doc folder:
>   "Files contained in the doc/ directory may be licensed under different terms.",
>   but there are no folder present so no license change)
> - Also separate the fields in the hash file by two spaces
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/gettext-tiny/gettext-tiny.hash | 6 +++---
>  package/gettext-tiny/gettext-tiny.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
