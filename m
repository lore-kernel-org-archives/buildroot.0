From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 10:31:06 +0200
Subject: [Buildroot] [PATCH v2] package: protobuf,
 python-protobuf: bump to v3.3.0
In-Reply-To: <20170512073503.601-1-mrugiero@gmail.com>
References: <20170511230019.3f18b34a@free-electrons.com>
 <20170512073503.601-1-mrugiero@gmail.com>
Message-ID: <20170702103106.405f47d2@windsurf>
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

I've dropped this part of the commit log, because the gcc < 4.5 issue
is not fixed by this bump.

But I've applied your commit to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
