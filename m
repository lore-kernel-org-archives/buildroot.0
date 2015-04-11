From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:27:39 +0200
Subject: [Buildroot] [PATCH 1/1] fftw: fix build failure with old gcc
In-Reply-To: <1428748907-3319-1-git-send-email-gwenj@trabucayre.com>
References: <1428748907-3319-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150411152739.416d6e89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sat, 11 Apr 2015 12:41:47 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> -Ofast is not available on gcc <2.6. This option is equivalent to 
> -O3 -ffast-math.
> 
> Fixes:
> http://autobuild.buildroot.org/results/207/207a20a3ca5e62029823b1361479d5cd38fefeb0/
> http://autobuild.buildroot.net/results/871/871b29c9bbf94aa05034c442f35c8771f83abe1e/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/fftw/fftw.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've removed Yann SoB, and fixed s/2.6/4.6/ in the commit log, and
applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
