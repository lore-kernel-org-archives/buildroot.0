From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Oct 2020 10:53:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: fix host build
In-Reply-To: <20201001052550.106879-1-fontaine.fabrice@gmail.com>
References: <20201001052550.106879-1-fontaine.fabrice@gmail.com>
Message-ID: <20201001105310.504cd3bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  1 Oct 2020 07:25:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 52c5c6050c5359288ca48c85024aebd169fab258 disabled debuginfod on
> target but not on host resulting in the following build failure:
> 
> configure: error: dependencies not found, use --disable-libdebuginfod to disable or --enable-libdebuginfod=dummy to build a (bootstrap) dummy library.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/97713c7e281313826067af559337832f22c3cb09
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/elfutils/elfutils.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
