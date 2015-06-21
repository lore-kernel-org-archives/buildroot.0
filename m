From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:35:56 +0200
Subject: [Buildroot] [PATCH v3 1/1] GNURadio: add processing blocks
In-Reply-To: <1428660114-11967-1-git-send-email-gwenj@trabucayre.com>
References: <1428660114-11967-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150621063556.1a215577@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Fri, 10 Apr 2015 12:01:54 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> GNURadio provides a set of processing blocks like analog or digital
> communication, filters, ...
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [build-tested only]
> ---
> Changes v2 -> v3:
>  * merge comment about fftw depends.
>  * change prompt content.
>  * suppress 'GNU Radio' in help messages.
> Changes v1 -> v2:
>  * supress hidden variable and use direct depends on
>    BR2_PACKAGE_FFTW_PRECISION_SINGLE.
>  * use a single if BR2_PACKAGE_FFTW_PRECISION_SINGLE for all options that need
>    this.
> ---
>  package/gnuradio/Config.in   | 60 ++++++++++++++++++++++++++++++++++++++++++++
>  package/gnuradio/gnuradio.mk | 55 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
