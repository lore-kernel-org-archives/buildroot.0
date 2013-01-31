From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jan 2013 23:53:26 +0100
Subject: [Buildroot] [PATCH 1/1] kernel: add support for building kernel
 companied userspace tools
In-Reply-To: <1359661716-18081-1-git-send-email-roylee17@gmail.com>
References: <1359661716-18081-1-git-send-email-roylee17@gmail.com>
Message-ID: <20130131235326.0ff65241@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tzu-Jung Lee,

On Fri,  1 Feb 2013 03:48:36 +0800, Tzu-Jung Lee wrote:

> +config BR2_LINUX_KERNEL_TOOLS_PERF
> +	bool "Build Performance analysis tools for Linux"
> +	default n
> +	select BR2_PACKAGE_LIBELF
> +	help
> +	  Performance counters for Linux are a new kernel-based
> +	  subsystem that provide a framework for all things
> +	  performance analysis.  It covers hardware level (CPU/PMU,
> +	  Performance Monitoring Unit) features and software features
> +	  (software counters, tracepoints) as well.

Thanks, but we already have a perf package. See package/perf/ in the
current Git version of Buildroot (it isn't part of the latest stable
2012.11 release, but it will be part of 2013.02).

See http://git.buildroot.net/buildroot/tree/package/perf.

If it somehow doesn't work for you, do not hesitate to report issues,
we'll try to fix them.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
