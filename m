From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:01:37 +0200
Subject: [Buildroot] [PATCH v2 04/15] package/Makefile.in: set variables
 for legacy f77 checks
In-Reply-To: <20160701162920.19632-5-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-5-s.martin49@gmail.com>
Message-ID: <20160701230137.407b68d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:09 +0200, Samuel Martin wrote:
> For fortran detection, some projects check for fortran availability
> using the FC/FCFLAGS variables, and others for the legacy F77/FFLAGS
> ones.
> So, make sure the legacy fortran F77 and FFLAGS variables are set in
> TARGET_CONFIGURE_OPTS.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2:
> - new patch
> ---
>  package/Makefile.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
