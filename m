From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:20:34 +0200
Subject: [Buildroot] [PATCH 1/2] libv4l: add optional sdl2_image
 dependency
In-Reply-To: <20180629195248.4008-1-fontaine.fabrice@gmail.com>
References: <20180629195248.4008-1-fontaine.fabrice@gmail.com>
Message-ID: <20180630182034.637c81e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 21:52:47 +0200, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libv4l/libv4l.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I've explained explicitly in the commit log that there is no
--enable/--disable option, as the configure.ac script simply uses
PKG_CHECK_MODULES() to detect the availability of sdl2_image.

Applied with this updated commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
