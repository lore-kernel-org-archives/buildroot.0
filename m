From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 20:11:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: fix build with aarch64_be
In-Reply-To: <20201015160435.846256-1-fontaine.fabrice@gmail.com>
References: <20201015160435.846256-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015201144.3e3c58c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 18:04:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> aarch64_be support was added by commit 3e3b524883cebf190099c72d41c817baa8192589
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/69ebf03c59b2af4140a39bc26f17d0396b6ec15d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...d-data-arch-arm64.txt-add-aarch64_be.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/botan/0001-src-build-data-arch-arm64.txt-add-aarch64_be.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
