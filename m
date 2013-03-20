From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 22:23:41 +0100
Subject: [Buildroot] [git commit] package/connman: bump version to 1.11
In-Reply-To: <20130301101142.D5D809ADCE@busybox.osuosl.org>
References: <20130301101142.D5D809ADCE@busybox.osuosl.org>
Message-ID: <20130320222341.5e947d69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Yann,

On Fri, 22 Feb 2013 23:46:32 +0100, Peter Korsgaard wrote:

> -CONNMAN_VERSION = 1.10
> +CONNMAN_VERSION = 1.11

Seems like Connman 1.11 is not happy with some IPv6 issues:
http://autobuild.buildroot.org/results/f99ae7af46c70f7c356b7771321511a42eb3694d/build-end.log.

Interestingly, the toolchain used here has IPv6 support. The toolchain
is an internal toolchain, using 3.8 kernel headers, so pretty recent.

Ideas?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
