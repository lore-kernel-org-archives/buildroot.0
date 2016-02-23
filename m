From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:57:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: set --enable-kernel to
 match kernel
In-Reply-To: <fd2384a12df3a10ae821b7facab9184290970b04.1453953049.git.sam.bobroff@au1.ibm.com>
References: <fd2384a12df3a10ae821b7facab9184290970b04.1453953049.git.sam.bobroff@au1.ibm.com>
Message-ID: <20160223235712.5b4a9de4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sam Bobroff,

On Thu, 28 Jan 2016 14:51:23 +1100, Sam Bobroff wrote:
> Glibc is currently configured without any "--enable-kernel" option.
> This causes it to use the oldest possible kernel API, slowing it down
> and preventing it from using any kernel features from later versions.
> 
> Since we are likely building a kernel and matching glibc together,
> backwards compatability is probably unnecessary so this patch
> unconditionally configures glibc with --enable-kernel set to
> BR2_TOOLCHAIN_HEADERS_AT_LEAST.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
