From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 21:49:08 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: Bump Codescape IMG MIPS
 version to 2018.09-02
In-Reply-To: <20181130165509.7163-1-paul.burton@mips.com>
References: <20181130165509.7163-1-paul.burton@mips.com>
Message-ID: <20181201214908.00e826e5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Nov 2018 16:55:21 +0000, Paul Burton wrote:
> The 2016.05-06 toolchain we've had support for is pretty outdated at
> this point, so update to the latest 2018.09-02 version.
> 
> Of note besides the typical component version bumps:
> 
>  - The toolchains are now provided by MIPS Tech LLC after its departure
>    from Imagination Technologies.
> 
>  - The download site changed as a result of that.
> 
>  - The toolchains are now built targeting CentOS 6 rather than CentOS 5.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> ---
>  .../Config.in                                      | 14 +++++++-------
>  .../toolchain-external-codescape-img-mips.hash     |  8 ++++----
>  .../toolchain-external-codescape-img-mips.mk       |  8 ++++----
>  3 files changed, 15 insertions(+), 15 deletions(-)

Thanks, both patches applied to next, with slightly tweaked commit
titles.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
