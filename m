From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Jul 2019 19:55:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfribidi: bump to version
 v1.0.5
In-Reply-To: <20190606171720.79017-1-aduskett@gmail.com>
References: <20190606171720.79017-1-aduskett@gmail.com>
Message-ID: <20190719195516.50cbf56a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Thu,  6 Jun 2019 13:17:20 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Changes include:
>   - Changing the URL to GitHub, as the old URL was no longer valid resulting in
>     the tar file being the HTML from www.fribidi.org.
> 
>   - Switching the package to a meson package.
> 
>   - Adding fix-meson.patch from
>     http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/fribidi/fribidi/meson.patch
>     which fixes the error: "Can not use target gen-unicode-version as a
>     generator because it is cross-built and no exe wrapper is defined."
> 
>   - Add a sha256 hash for the license file.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libfribidi/0001-fix-meson.patch | 42 +++++++++++++++++++++++++
>  package/libfribidi/libfribidi.hash      |  5 +--
>  package/libfribidi/libfribidi.mk        | 16 +++-------
>  3 files changed, 50 insertions(+), 13 deletions(-)
>  create mode 100644 package/libfribidi/0001-fix-meson.patch

Could you rebase on the latest master, in which we merged a separate
patch that only does the 1.0.5 bump ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
