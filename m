From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:39:45 +0200
Subject: [Buildroot] [PATCH] openblas: build only C-language BLAS if the
 toolchain doesn't have Fortran
In-Reply-To: <1467645779-35133-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467645779-35133-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160704173945.78386c1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 16:22:59 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/openblas/openblas.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I've applied, after reworking the commit title and comment. Indeed when
you say "openblas: build only C-language BLAS if the toolchain doesn't
have Fortran" one might think that the C-language BLAS will only be
built when Fortran is not available.

While what you are doing is just making sure that BLAS tries to only
build the C version when Fortran support is not available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
