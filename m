From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:31:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/openswan: bump to version 3.0.0
In-Reply-To: <20210122220403.3051990-1-fontaine.fabrice@gmail.com>
References: <20210122220403.3051990-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123213136.2c3249ad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 23:04:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Use USE_NOMANINSTALL which is available since version 2.6.52 and
>   https://github.com/xelerance/Openswan/commit/9146de03c8c9eb4e55389599ce44aa8f773b2990
> - openswan can be built on musl since version 2.6.52.1 and
>   https://github.com/xelerance/Openswan/commit/ddb6086c50b5d087ebcabb580914b026aa71200e
> - openswan can't be built on uclibc-ng anymore and upstream rejected the
>   patch to fix the build failure:
>   https://github.com/xelerance/Openswan/pull/453
> - Update indentation in hash file (two spaces)
> 
> https://github.com/xelerance/Openswan/releases/tag/v3.0.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../openswan/0001-fix-build-with-gcc-10.patch | 49 -------------------
>  package/openswan/Config.in                    |  6 +--
>  package/openswan/openswan.hash                |  6 +--
>  package/openswan/openswan.mk                  |  7 +--
>  4 files changed, 10 insertions(+), 58 deletions(-)
>  delete mode 100644 package/openswan/0001-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
