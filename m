From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:45:36 +0200
Subject: [Buildroot] [PATCH] gnuradio: backport patch to fix gr-fec
 compilation
In-Reply-To: <1470749071-20784-1-git-send-email-gwenj@trabucayre.com>
References: <1470749071-20784-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20160809154536.007d643a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Aug 2016 15:24:31 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Fix:
> http://autobuild.buildroot.net/results/f14/f14f4f62b5f23c652fa9411d9c569c2ab3394fb5
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  .../gnuradio/0003-fix_compilation_in_gcc-6.patch   | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/gnuradio/0003-fix_compilation_in_gcc-6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
