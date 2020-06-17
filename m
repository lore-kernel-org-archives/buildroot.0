From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:58:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump to version 3.9.2
In-Reply-To: <20200615184632.493821-1-asafka7@gmail.com>
References: <20200615184632.493821-1-asafka7@gmail.com>
Message-ID: <20200617225838.5a8fdf7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 21:46:25 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Remove patch (applied upstream).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...on.build-libfuse-is-a-C-only-project.patch | 39 -------------------
>  package/libfuse3/libfuse3.hash                |  2 +-
>  package/libfuse3/libfuse3.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 package/libfuse3/0001-meson.build-libfuse-is-a-C-only-project.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
