From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:16:52 +0100
Subject: [Buildroot] [PATCH v4 01/17] package/fftw: prepare for
 splitting into multiple packages
In-Reply-To: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190206101652.376fbf92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jan 2019 14:50:55 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> In preparation for splitting into multiple packages, this commit
> changes the fftw.mk package to use FFTW_COMMON_CONF_OPTS,
> FFTW_COMMON_CONF_ENV and FFTW_COMMON_CFLAGS, which will be re-used by
> the soon-to-be-introduced per-precision packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/fftw/fftw.mk | 40 +++++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 19 deletions(-)

Entire series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
