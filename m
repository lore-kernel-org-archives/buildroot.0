From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 18 Feb 2019 15:05:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-17
In-Reply-To: <20190218070048.D838922270@silver.osuosl.org>
References: <20190218070048.D838922270@silver.osuosl.org>
Message-ID: <20190218150524.58b7f1a1@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Feb 2019 07:00:43 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
[...]    
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
[...]
>                fftw-quad-3.3.8 | 1 
[...]
> 
> Detail of failures
> ------------------
> 
[...]
> | x86_64 |                fftw-quad-3.3.8 | NOK |
> http://autobuild.buildroot.net/results/bbefc1533570b123dfc5213f99ba7c8c6bd8177f
[...]
fftw is unable to find libquadmath.so but this library is  missing in
x86_64-ctng_locales-linux-gnu.tar.xz.

Regards.

Gwen
