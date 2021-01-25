From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 23:23:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/trace-cmd: fix build with musl
In-Reply-To: <20210104073921.380824-1-fontaine.fabrice@gmail.com>
References: <20210104073921.380824-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125232355.018bc981@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Jan 2021 08:39:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/85ba0718f51eea348472dba89c566c136314a61e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-trace-cmd-libtracecmd-API-cleanup.patch | 1486 +++++++++++++++++
>  ...make-it-build-against-musl-C-library.patch |  140 ++
>  2 files changed, 1626 insertions(+)
>  create mode 100644 package/trace-cmd/0001-trace-cmd-libtracecmd-API-cleanup.patch
>  create mode 100644 package/trace-cmd/0002-trace-cmd-make-it-build-against-musl-C-library.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
