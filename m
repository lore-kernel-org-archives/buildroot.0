From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 17:16:52 +0200
Subject: [Buildroot] [PATCHv3] package/mtd: needs zstd
In-Reply-To: <20190802122109.22928-1-yann.morin.1998@free.fr>
References: <20190802122109.22928-1-yann.morin.1998@free.fr>
Message-ID: <e55be58d-877a-3fac-2820-eb4afb77742d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/08/2019 14:21, Yann E. MORIN wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> For the target variant, zstd is an optional dependency when ubifs-tools
> are enabled. For the host variant, we make it an unconditional dependency.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/99b/99baf1de106f9c80a32e665263c1e4278097643d/ (target)
>     http://autobuild.buildroot.org/results/e3b/e3b96704f0b23e82999aa3d6e93233edecbecfe7/ (host)
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> Tested-by: Markus Mayer <mmayer@broadcom.com>
> [yann.morin.1998 at free.fr: fix the target variant too]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 Applied to master, thanks.

 Regards,
 Arnout
