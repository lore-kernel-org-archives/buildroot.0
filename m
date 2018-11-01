From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:40:57 +0100
Subject: [Buildroot] [PATCH v6 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <5400d862-d44e-c5ab-b3e6-b3b68193862e@mind.be>
References: <20181026130358.11776-1-jagan@amarulasolutions.com>
 <5400d862-d44e-c5ab-b3e6-b3b68193862e@mind.be>
Message-ID: <20181101134057.6fe42528@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Nov 2018 12:59:22 +0100, Arnout Vandecappelle wrote:

>  I was about to apply, but U-Boot doesn't seem to build without swig:
> 
> PYMOD   scripts/dtc/pylibfdt/_libfdt.so
> unable to execute 'swig': No such file or directory
> error: command 'swig' failed with exit status 1
> make[5]: *** [scripts/dtc/pylibfdt/Makefile:27: scripts/dtc/pylibfdt/_libfdt.so]
> Error 1
> 
>  I believe this has been discussed before but I can't find it.

This can be fixed by enabling BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
