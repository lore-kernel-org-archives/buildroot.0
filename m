From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:01:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/mtd: fix build without openssl
In-Reply-To: <4dfb0750e6edabebc3180054ac16ef875d7f41a0.1553856287.git.baruch@tkos.co.il>
References: <4dfb0750e6edabebc3180054ac16ef875d7f41a0.1553856287.git.baruch@tkos.co.il>
Message-ID: <20190329170144.3e39903a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Mar 2019 13:44:46 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Add a patch that removes dependency on openssl header when openssl is
> not installed.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a78/a78544def5c17edccdf5db821318b8efa3fc7b8f/
> http://autobuild.buildroot.net/results/ed8/ed82ef6c15d7f59c9b93d237f53fc09513ed5c4f/
> http://autobuild.buildroot.net/results/ede/ede17d68948fd478c366673b7d22f07cee3bd09a/
> 
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...mkfs.ubifs-fix-build-without-openssl.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/mtd/0001-mkfs.ubifs-fix-build-without-openssl.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
