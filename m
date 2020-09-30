From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:57:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: fix tests with
 uclibc
In-Reply-To: <20200926201817.996329-1-fontaine.fabrice@gmail.com>
References: <20200926201817.996329-1-fontaine.fabrice@gmail.com>
Message-ID: <20200930225726.1982f143@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Sep 2020 22:18:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> It should be noted that upstream does not want to add a --disable-tests
> option: https://review.lttng.org/c/babeltrace/+/4075
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1e50e1ff90c1ac2af2223365dc0cd6e1914bcd75
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...trace_ir_ref.c-rename-user-structure.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
