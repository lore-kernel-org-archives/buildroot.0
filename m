From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Nov 2010 18:38:34 +0100
Subject: [Buildroot] Buildroot Patches I Use [2] - Build In Stages
In-Reply-To: <1289317805.30565.114.camel@tr-pentomino>
References: <1289317805.30565.114.camel@tr-pentomino>
Message-ID: <20101109183834.7dd0085f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 09 Nov 2010 07:50:05 -0800
Darcy Watkins <dwatkins@tranzeo.com> wrote:

> This patch is handy if you want to build in two stages.  The first
> stage is to build up to before generating the rootfs.  Then you could
> run other programs, scripts etc to generate stuff externally and add
> them to your target area.  Then the second stage generates the rootfs
> images.
> 
> This is handy for cases where you want to use an external set of
> scripts to drive the build process but have buildroot do some of the
> work so that you don't have to reinvent as many wheels.

Isn't BR2_ROOTFS_POST_BUILD_SCRIPT sufficient for this use case ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
