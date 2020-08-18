From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 16:40:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: fix build with musl
In-Reply-To: <20200817201335.3767619-1-fontaine.fabrice@gmail.com>
References: <20200817201335.3767619-1-fontaine.fabrice@gmail.com>
Message-ID: <20200818164028.41f4a864@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2020 22:13:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/0c49b3e90361ced63cad4807dbe1b13c595f5f97
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nts-ns-tp.h-Fix-build-with-musl-libc.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
