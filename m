From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:24:41 +0200
Subject: [Buildroot] [PATCH 1/3] package/lttng-libust: bump to version
 2.10.5
In-Reply-To: <20190928072757.27041-1-fontaine.fabrice@gmail.com>
References: <20190928072757.27041-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928212441.1013fa86@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 09:27:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove second patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...002-Fix-namespace-our-gettid-wrapper.patch | 90 -------------------
>  package/lttng-libust/lttng-libust.hash        |  8 +-
>  package/lttng-libust/lttng-libust.mk          |  2 +-
>  3 files changed, 6 insertions(+), 94 deletions(-)
>  delete mode 100644 package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch

All three applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
