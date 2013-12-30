From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:08:49 +0100
Subject: [Buildroot] [v2 1/1] xenomai: fix build failure when
 HAVE_OPEN64 is undefined
In-Reply-To: <1388354779-17875-1-git-send-email-romain.naour@openwide.fr>
References: <1388354779-17875-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20131231000849.47b52d94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 29 Dec 2013 23:06:19 +0100, Romain Naour wrote:
> fixes: http://autobuild.buildroot.org/results/d59/d590be34637a4043c929ce615f9db504484be435/build-end.log
> 
> Upstream patch:
> http://git.xenomai.org/xenomai-2.6.git/commit/?id=71345fe15f126ae3a596af309945d0af6edfbbbb
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...uild-failure-when-HAVE_OPEN64-is-undefine.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
