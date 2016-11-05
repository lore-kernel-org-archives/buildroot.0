From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:11:11 +0100
Subject: [Buildroot] [PATCH] lttng-babeltrace: fix static build again
In-Reply-To: <20161104164137.19006-1-eeppeliteloop@gmail.com>
References: <20161104164137.19006-1-eeppeliteloop@gmail.com>
Message-ID: <20161105131111.41fb93ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 Nov 2016 12:41:37 -0400, Philippe Proulx wrote:
> I accidentally removed the static build patch when bumping to v1.4.0,
> thinking it was merged upstream as of this version, but it's not the
> case (it's merged in master), so let's keep the patch file.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
>  ...ix-uuid-support-detection-on-static-build.patch | 86 ++++++++++++++++++++++
>  package/lttng-babeltrace/lttng-babeltrace.mk       |  4 +-
>  2 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 package/lttng-babeltrace/0003-fix-uuid-support-detection-on-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
