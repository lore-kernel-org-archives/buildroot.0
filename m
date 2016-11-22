From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 10:40:36 +0100
Subject: [Buildroot] [PATCH] gnuradio: gr-fec: add missing dependency to
 gsl
In-Reply-To: <1479806301-9840-1-git-send-email-gwenj@trabucayre.com>
References: <1479806301-9840-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20161122104036.33bbd386@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 10:18:21 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gr-fec needs gsl. Without this dependency cmake search gsl in the host system.
> This issue produce errors like :
> 
> arm-buildroot-linux-uclibcgnueabihf-gcc: ERROR: unsafe header/library path used
> in cross-compilation: '-I/usr/include'
> make[3]: *** [gr-fec/lib/CMakeFiles/gnuradio-fec.dir/reed-solomon/encode_rs.c.o] Error 1
> 
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/Config.in   | 1 +
>  package/gnuradio/gnuradio.mk | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
