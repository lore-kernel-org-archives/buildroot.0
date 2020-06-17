From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:48:48 +0200
Subject: [Buildroot] [PATCH v2] package/ttyd: new package
In-Reply-To: <20200616171901.4566-1-b.bilas@grinn-global.com>
References: <20200616171901.4566-1-b.bilas@grinn-global.com>
Message-ID: <20200617224848.084dccef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jun 2020 19:19:01 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> ttyd is a simple command-line tool for sharing
> terminal over the web.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
> Changes v1 -> v2:
>   - Add the separate dependency on MMU and
>     the availability of atomic operations. 
>     (Suggested by Baruch)
>     
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../ttyd/0001-cmake-fix-build-without-C.patch | 41 +++++++++++++++++++
>  package/ttyd/Config.in                        | 21 ++++++++++
>  package/ttyd/ttyd.hash                        |  3 ++
>  package/ttyd/ttyd.mk                          | 13 ++++++
>  6 files changed, 80 insertions(+)
>  create mode 100644 package/ttyd/0001-cmake-fix-build-without-C.patch
>  create mode 100644 package/ttyd/Config.in
>  create mode 100644 package/ttyd/ttyd.hash
>  create mode 100644 package/ttyd/ttyd.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
