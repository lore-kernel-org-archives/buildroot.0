From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 07 Nov 2016 16:37:43 -0300
Subject: [Buildroot] freescale_p2020ds_defconfig fails to build
In-Reply-To: <20161105143637.0fffe44d@free-electrons.com>
References: <20161105143637.0fffe44d@free-electrons.com>
Message-ID: <d3c304cbc093e7e90969a04c97d3f28a@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-05 10:36, Thomas Petazzoni wrote:

> Hello Gustavo,
> 
> You are the one who submitted the freescale_p2020ds_defconfig to
> Buildroot. However, this defconfig currently fails to build, because
> the kernel is too old to build with gcc 5.x. Could you have a look and
> propose a patch to fix this defconfig?
> 
> See
> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/freescale_p2020ds_defconfig.log.FAIL
> for the full build log.

Hi.
Unfortunately i don't have one of these at my reach any more, and it 
uses an ex-freescale (now nxp, eventually qualcomm) git kernel to work 
around some design flaws, which makes vanilla kernels without patching 
unusable last time i tried.
Other than locking gcc down to 4.9 (temporary fix) or dropping it 
there's not much i can do.
Regards.
