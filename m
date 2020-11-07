From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:23:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: bump to version 2.17.0
In-Reply-To: <20201106204602.276693-1-fontaine.fabrice@gmail.com>
References: <20201106204602.276693-1-fontaine.fabrice@gmail.com>
Message-ID: <20201107132355.653ed6f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Nov 2020 21:46:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://botan.randombit.net/news.html#version-2-17-0-2020-11-05
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...d-data-arch-arm64.txt-add-aarch64_be.patch | 31 -------------------
>  package/botan/botan.hash                      |  2 +-
>  package/botan/botan.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
