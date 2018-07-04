From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:05:09 +0200
Subject: [Buildroot] [PATCH v2] alsa-utils: bat needs fftw single
 precision
In-Reply-To: <87c2b0d5f06ca9c6842b52cefc76aaf5923d41d7.1530592176.git.baruch@tkos.co.il>
References: <87c2b0d5f06ca9c6842b52cefc76aaf5923d41d7.1530592176.git.baruch@tkos.co.il>
Message-ID: <20180704220509.7eba5979@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Jul 2018 07:29:36 +0300, Baruch Siach wrote:
> Otherwise the configure check for fftw fails, and alsabat does not link
> with libfftw. Instead of selecting fftw unconditionally, make fftw
> single precision an optional dependency. Add a help text comment about
> that.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Make fftw single precision an optional dependency (Thomas P)
> ---
>  package/alsa-utils/Config.in     | 3 ++-
>  package/alsa-utils/alsa-utils.mk | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

The commit title and commit log were no longer really suitable for what
the patch does now. I've reworked them, extended the Config.in help
text and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
