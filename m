From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 May 2020 07:12:15 +0200
Subject: [Buildroot] [PATCH 08/12] package/atk: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-8-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
 <20200401002134.1779241-8-aduskett@gmail.com>
Message-ID: <20200511071215.6a9ff2cb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 Mar 2020 17:21:30 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, add the gobject-introspection package to
> the dependency list and set the conf opt -Dintrospection=true.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This patch breaks the build:

  http://autobuild.buildroot.net/results/f40/f40805c59cef2bc56ea7f816f09c489fc631e7af/build-end.log

/bin/sh: 1: /tmp/instance-2/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/tmp/instance-2/output-1/host/bin/g-ir-scanner: not found

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
