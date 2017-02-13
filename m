From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:39:00 +0100
Subject: [Buildroot] [PATCH] glmark2: bump version
In-Reply-To: <20170213200619.10535-1-gary.bisson@boundarydevices.com>
References: <20170213200619.10535-1-gary.bisson@boundarydevices.com>
Message-ID: <20170213223900.7167f053@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 21:06:19 +0100, Gary Bisson wrote:
> The package otherwise fails to build with a recent toolchain with GCC6
> (tested with Linaro ARM 2016.11).
> 
> It used to fail at sqrt check during package configuration:
>  Checking for function sqrt               : not found
>  The configuration failed
> 
> Bumping version to latest HEAD fixes the issue as explained in the
> following discussion:
> https://github.com/glmark2/glmark2/issues/15
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/glmark2/glmark2.hash | 2 +-
>  package/glmark2/glmark2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. However, I had to add a reference to an
autobuilder issue (after checking that I could reproduce the issue, and
that it was indeed fixed by your patch). Next time, could you make sure
to include a reference to the autobuilder failure being fixed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
