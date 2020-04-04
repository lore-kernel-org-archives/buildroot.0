From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:25:58 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libuhttpd: new package
In-Reply-To: <20200404170428.28121-1-zhaojh329@gmail.com>
References: <20200404170428.28121-1-zhaojh329@gmail.com>
Message-ID: <20200404232558.57525f29@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Apr 2020 01:04:28 +0800
Jianhui Zhao <zhaojh329@gmail.com> wrote:

> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Fix build fail when not found libdl
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/libuhttpd/Config.in      |  8 +++++++
>  package/libuhttpd/libuhttpd.hash |  3 +++
>  package/libuhttpd/libuhttpd.mk   | 39 ++++++++++++++++++++++++++++++++
>  5 files changed, 52 insertions(+)
>  create mode 100644 package/libuhttpd/Config.in
>  create mode 100644 package/libuhttpd/libuhttpd.hash
>  create mode 100644 package/libuhttpd/libuhttpd.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
