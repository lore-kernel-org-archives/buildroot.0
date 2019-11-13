From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Nov 2019 13:39:59 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <a00e6f2a-69df-00ab-763a-1f0a396e4d5b@smile.fr>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
 <20191111153657.1a56760e@windsurf.home>
 <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
 <08d749aa-743d-d05c-7aae-b98e70862617@codethink.co.uk>
 <20191112212446.21cbdbca@windsurf>
 <77353588-bf06-8112-4afe-41f488dbaa66@codethink.co.uk>
 <1debcd70-de93-f709-a313-f358572c3048@smile.fr>
 <20191113130630.759bf8de@windsurf>
 <a00e6f2a-69df-00ab-763a-1f0a396e4d5b@smile.fr>
Message-ID: <20191113133959.037795e4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Nov 2019 13:32:46 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > $ ls -1 support/config-fragments/autobuild/br-arm-internal-*
> > support/config-fragments/autobuild/br-arm-internal-full.config
> > support/config-fragments/autobuild/br-arm-internal-glibc.config
> > support/config-fragments/autobuild/br-arm-internal-musl.config  
> 
> Ok good, so the list here [1] is outdated.
> 
> [1] http://autobuild.buildroot.org/toolchains/configs/

This list is completely unused. It was kept only during the transition
period, for autobuilders that were still using the old way of
generating the configuration.

I can get rid of them, since nothing should use them nowadays.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
