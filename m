From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 17:13:28 +0100
Subject: [Buildroot] [PATCH 2/5] lttng-tools: bump to version 2.8.2
In-Reply-To: <20161029180339.24535-3-eeppeliteloop@gmail.com>
References: <20161029180339.24535-1-eeppeliteloop@gmail.com>
 <20161029180339.24535-3-eeppeliteloop@gmail.com>
Message-ID: <20161030171328.4bfa9809@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 14:03:36 -0400, Philippe Proulx wrote:
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Again, the commit log shouldn't be empty. Especially, please include
some details about the patches that are dropped (why?) and the patches
that are added.

> diff --git a/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch b/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
> new file mode 100644
> index 0000000..b5cc7ec
> --- /dev/null
> +++ b/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
> @@ -0,0 +1,11 @@

This patch lacks a description + Signed-off-by.

> diff --git a/package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch b/package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
> new file mode 100644
> index 0000000..f1fe873
> --- /dev/null
> +++ b/package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
> @@ -0,0 +1,26 @@
> +From fc743b22fc26eab9f9dbf48e4505ed2394924bba Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Mon, 13 Jun 2016 18:44:17 -0400
> +Subject: [PATCH lttng-tools 4/4] Fix: strerror_r behavior is glibc specific

Please generate the patches with "git format-patch -N", so that we
don't have a specifier like 3/4 or 4/4, which doesn't make any sense.

> +
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>

Please add your Signed-off-by on the patch, and if they come from
upstream, a reference to the upstream commit.

> diff --git a/package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch b/package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch
> new file mode 100644
> index 0000000..dc6a7dd
> --- /dev/null
> +++ b/package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch
> @@ -0,0 +1,427 @@
> +From 451f4d875537c073a966d6ccfb2fe08a497fbd7b Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Wed, 15 Jun 2016 11:01:08 -0500
> +Subject: [PATCH lttng-tools 3/3] Set thread stack size to ulimit soft value

Why do we need this?

Also same comments as for the previous patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
