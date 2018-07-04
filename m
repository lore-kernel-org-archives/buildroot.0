From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:31:46 +0200
Subject: [Buildroot] [PATCH 1/1] boost: graph needs regex
In-Reply-To: <20180703222235.14643-1-fontaine.fabrice@gmail.com>
References: <20180703222235.14643-1-fontaine.fabrice@gmail.com>
Message-ID: <20180704223146.4d82436c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jul 2018 00:22:35 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/m68k-linux-readelf -d output/staging/usr/lib/libboost_graph.so
> 
> Dynamic section at offset 0x47f00 contains 28 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_regex.so.1.67.0]
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. Did you look at Arnout proposal to
automatically error out if a dependency within boost is not correctly
handled ? Arnout had an interesting idea to achieve this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
