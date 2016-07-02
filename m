From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:43:42 +0200
Subject: [Buildroot] [PATCH v2] fftw: Disable combined threads when
 building with OpenMP support
In-Reply-To: <1466614816-24785-1-git-send-email-nerv@dawncrow.de>
References: <1466614816-24785-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160702154342.4527d84b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 19:00:16 +0200, Andr? Hentschel wrote:
> Otherwise fftw fails to configure:
> configure: error: --with-combined-threads incompatible with --enable-openmp
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/fftw/fftw.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
