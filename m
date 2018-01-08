From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 23:37:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] cups-filters: add new package
 cups-filters 1.17.9
In-Reply-To: <20171023132611.32525-1-olivier.schonken@gmail.com>
References: <20171023132611.32525-1-olivier.schonken@gmail.com>
Message-ID: <20180108233718.0b5af6a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Oct 2017 15:26:11 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
> v1 -> v2  -  Updated/Fixed indentation in .mk and Config.in
> 	- Added fontconfig and freetype as dependencies
> 	- Added entry in DEVELOPERS file
> 	- Tested with libjpeg and libjpeg-turbo 
> 	  (Build with libjpeg requires .pc patch for libjpeg)

Thanks, I've applied, with the following changes:

    [Thomas:
     - add missing select BR2_PACKAGE_JPEG
     - use jpeg instead of libjpeg
     - sort selects alphabetically
     - fix Config.in comment dependencies.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
