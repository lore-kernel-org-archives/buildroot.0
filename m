From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:28:37 +0200
Subject: [Buildroot] [PATCH v3 3/9] package/libavl: add package
In-Reply-To: <20191011124131.28246-4-heiko.thiery@gmail.com>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
 <20191011124131.28246-4-heiko.thiery@gmail.com>
Message-ID: <20191022232837.40222686@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Oct 2019 14:40:41 +0200
heiko.thiery at gmail.com wrote:

> From: Michael Walle <michael@walle.cc>
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> ---
>  DEVELOPERS                             |  3 ++
>  package/Config.in                      |  1 +
>  package/libavl/0001-fix-makefile.patch | 49 ++++++++++++++++++++++++++
>  package/libavl/Config.in               | 13 +++++++
>  package/libavl/libavl.hash             |  5 +++
>  package/libavl/libavl.mk               | 43 ++++++++++++++++++++++
>  6 files changed, 114 insertions(+)
>  create mode 100644 package/libavl/0001-fix-makefile.patch
>  create mode 100644 package/libavl/Config.in
>  create mode 100644 package/libavl/libavl.hash
>  create mode 100644 package/libavl/libavl.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
