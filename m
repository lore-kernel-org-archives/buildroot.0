From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 21:27:36 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
	arc-2016.09-eng008
In-Reply-To: <1470849040-9200-1-git-send-email-vzakhar@synopsys.com>
References: <1470849040-9200-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160810212736.6a814ad9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new update!

On Wed, 10 Aug 2016 20:10:40 +0300, Vlad Zakharov wrote:
> As described at:
> 4520524ba055706236db9f00dd79f1b2e2e87fde
> this commit continues a series of updates of ARC tools.
> This time we're updating tools to arc-2016.09-eng008.
> 
> Main updates were made for gcc. It was switched to GCC 6 and to
> OSABI v4.

Beware that using GCC 6 is causing to cause a number of issues related
to GCC 6 itself and not to ARC. We already have one GCC 6 toolchain for
ARM, and we have a number of build failures caused by this toolchain
due to the use of GCC 6.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
