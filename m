From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:13:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/efl: bump to version 1.22.0
In-Reply-To: <20190413131418.31097-1-romain.naour@gmail.com>
References: <20190413131418.31097-1-romain.naour@gmail.com>
Message-ID: <20190413211349.14c51bca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 15:14:17 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Remove upstream commit.
> 
> https://www.enlightenment.org/news/efl-1.22.0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...e-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch | 34 ----------------------
>  package/efl/efl.hash                               |  4 +--
>  package/efl/efl.mk                                 |  2 +-
>  3 files changed, 3 insertions(+), 37 deletions(-)
>  delete mode 100644 package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
