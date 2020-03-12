From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Mar 2020 14:50:05 +0100
Subject: [Buildroot] [PATCH] package/util-linux: fix build for riscv64
 and powerpc64le
In-Reply-To: <20200312114759.31764-1-unixmania@gmail.com>
References: <20200312114759.31764-1-unixmania@gmail.com>
Message-ID: <20200312145005.3c16bec0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Thu, 12 Mar 2020 08:47:59 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Pull two upstream patches that fix the declaration of pidfd_open and
> pidfd_send_signal.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/2396b04478f9d358b94f2e2e05540625ddc9f205/
>   http://autobuild.buildroot.net/results/ed4b5ec61bd33d3ccf0ebb16000af46d0499366d/
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

We normally require to sign-off on the patches themselves, when they
are added to Buildroot packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
