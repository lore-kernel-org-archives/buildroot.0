From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 10:07:57 +0200
Subject: [Buildroot] [PATCH v2] package: protobuf,
 python-protobuf: bump to v3.3.0
In-Reply-To: <20170512073503.601-1-mrugiero@gmail.com>
References: <20170511230019.3f18b34a@free-electrons.com>
 <20170512073503.601-1-mrugiero@gmail.com>
Message-ID: <20170512100757.3e865c73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 04:35:03 -0300, Mario J. Rugiero wrote:
> Includes upstream patch working around a gcc bug which got fixed in version 4.5.0.
> 
> Fixes:
> http://autobuild.buildroot.org/results/77d/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54/
> http://autobuild.buildroot.org/results/21f/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3/
> http://autobuild.buildroot.org/results/24e/24e880086c87d40b5d79a90d805acc75b33d484c/
> 
> Tested with:
> qemu_aarch64_virt_defconfig
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>

OK, but you just changed the hash... why did the hash change in the
first place, between the original 3.3.0 and the new 3.3.0 version ?

Did upstream re-upload a different tarball ? If that's the case, could
you tell upstream that this is really really bad ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
