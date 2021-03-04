From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Mar 2021 21:26:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to latest git
 commit
In-Reply-To: <20210303091904.467706-1-fontaine.fabrice@gmail.com>
References: <20210303091904.467706-1-fontaine.fabrice@gmail.com>
Message-ID: <c287a0b7-9896-9c0f-7b3c-77999da85b82@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/03/2021 10:19, Fabrice Fontaine wrote:
> Bump to latest git commit to retrieve the following commits:
> - https://github.com/rsmarples/dhcpcd/commit/e3a40586dbb584774d0a17bc277e69cb500cfa38
> - https://github.com/rsmarples/dhcpcd/commit/f3f7332001d5d5722239f6b7279f32923e4eedd0
> - https://github.com/rsmarples/dhcpcd/commit/d670866ce008c21cbf6d5b20c4d4af6460ec35d2
> - https://github.com/rsmarples/dhcpcd/commit/19c3d9209a834e02918a17e011afd9da3e5be38d
> - https://github.com/rsmarples/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266
> - https://github.com/rsmarples/dhcpcd/commit/dcfd7a23f002793a855156255e81662ef84064d3
> - https://github.com/rsmarples/dhcpcd/commit/166491c2953546a677073694036f43a65fc25063

 This makes it seem as if the bump just comprises those commits. However, the
bump actually comprises about 40 other commits as well. This makes a much bigger
diff, and not something I think we are willing to take in just before the
2021.02 release.

 Therefore, I've instead cherry-picked the above commits and added them as
individual patches to Buildroot.

 I've also claimed authorship of the change (since nothing much was left of your
patch), but kept your SoB.

 I hope there will be a new release of dhcpcd  soonish. Roy usually makes
several releases per month, but now it's almost 3 months ago...

 Regards,
 Arnout

> 
> This will fix builds with arc, microblaze, nios2, or1k, sh, sparc and
> xtensa
> 
> Update hash of LICENSE (update in year:
> https://github.com/rsmarples/dhcpcd/commit/f3d2ff551bb9b2919094ba6526dcebe217824f5c)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9ed863b3ba5e6e0587a48e619395e5bdb7e9c557
>  - http://autobuild.buildroot.org/results/affd2f094084c4f53a324830539d07050b83587e
>  - http://autobuild.buildroot.org/results/67f39606054930d307ddd0eb7743f06316d41544
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
