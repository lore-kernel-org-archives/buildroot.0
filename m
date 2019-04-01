From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:47:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpm: fix nss build on musl
In-Reply-To: <20190401055543.21087-1-fontaine.fabrice@gmail.com>
References: <20190401055543.21087-1-fontaine.fabrice@gmail.com>
Message-ID: <20190401224758.5c44335b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  1 Apr 2019 07:55:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/395fd44a930dfc2ad380bc735c26d9ce62344295
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0002-rpmio-digest_nss.c-fix-build-on-musl.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/rpm/0002-rpmio-digest_nss.c-fix-build-on-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
