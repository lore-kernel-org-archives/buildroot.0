From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:55:43 +0200
Subject: [Buildroot] [PATCH v2 02/15] package/gcc: wrap gfortran
In-Reply-To: <20160701162920.19632-3-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-3-s.martin49@gmail.com>
Message-ID: <20160701225543.7efaacbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:07 +0200, Samuel Martin wrote:
> gfortran supports all options supported by gcc, so it can and should be called
> via the toolchain wrapper.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> ---
> changes v1->v2:
> - none
> ---
>  package/gcc/gcc.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
