From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 15:52:53 +0100
Subject: [Buildroot] [PATCH 1/1] set minimum cmake version to 3.10
In-Reply-To: <20200203142738.1558715-1-aduskett@gmail.com>
References: <20200203142738.1558715-1-aduskett@gmail.com>
Message-ID: <20200203155253.3846f71a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 06:27:38 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> The CMakeLists.txt file uses the CMP0091 which is an MSVC runtime library flag
> abstraction macro.
> 
> Because we are not building ninja for Microsoft, it is safe to remove this
> macro and set the minimum version to 3.10.
> 
> Fixes:
> http://autobuild.buildroot.net/results/992b34c5625ec733d8dce678aa7a7540c4768ca1
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...01-set-minimum-cmake-version-to-3.10.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/ninja/0001-set-minimum-cmake-version-to-3.10.patch

Fixed the commit title and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
