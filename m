From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:26:05 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/ethtool: add patch to fix
 build failures
In-Reply-To: <20200606183817.5113-1-heiko.thiery@gmail.com>
References: <20200606183817.5113-1-heiko.thiery@gmail.com>
Message-ID: <20200606212605.239cdc17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 20:38:18 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Add a patch from the kernel netdev mailing list [1] that solves
> autobuilder failures.
> 
> Fixes:
> http://autobuild.buildroot.net/results/394e846bb48a0cc8564ebc3e8d1179ccd1f1560d/
> 
> [1] https://patchwork.ozlabs.org/project/netdev/patch/bb60cbfe99071fca4b0ea9e62d67a2341d8dd652.1590707335.git.mkubecek at suse.cz/
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  .../0001-netlink-fix-build-warnings.patch     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/ethtool/0001-netlink-fix-build-warnings.patch

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
