From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:19:12 +0100
Subject: [Buildroot] [RFCv2 1/3] qemu: add
 BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
In-Reply-To: <20180207212355.7464-2-aduskett@gmail.com>
References: <20180207212355.7464-1-aduskett@gmail.com>
 <20180207212355.7464-2-aduskett@gmail.com>
Message-ID: <20180208221912.44dd2d54@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Feb 2018 16:23:53 -0500, Adam Duskett wrote:
> Match the style used with other packages such as valgrind.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/qemu/Config.in.host | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Applied to next after dropping the spurious/unrelated change in the
Config.in help text, as noticed by Yann. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
