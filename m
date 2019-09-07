From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:47:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-babeltrace: bump to
 version 1.5.7
In-Reply-To: <20190905171020.3705-1-fontaine.fabrice@gmail.com>
References: <20190905171020.3705-1-fontaine.fabrice@gmail.com>
Message-ID: <20190907144748.5f96199e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu,  5 Sep 2019 19:10:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove second patch (already in version)
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x_lib_elfutils.m4-add-cache-variable.patch | 77 -------------------
>  .../lttng-babeltrace/lttng-babeltrace.hash    | 10 ++-
>  package/lttng-babeltrace/lttng-babeltrace.mk  |  4 +-
>  3 files changed, 9 insertions(+), 82 deletions(-)
>  delete mode 100644 package/lttng-babeltrace/0002-m4-ax_lib_elfutils.m4-add-cache-variable.patch

Applied to master, thanks. When you're doing version bumps, it would be
nice if you could check that the release-monitoring.org information for
that package is correct, and that Buildroot finds it properly through
pkg-stats (see also http://autobuild.buildroot.net/stats/). In this
case, it was just a matter of adding a mapping lttng-babeltrace ->
babeltrace on release-monitoring.org for the Buildroot distribution.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
