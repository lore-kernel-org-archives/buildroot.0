From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 29 Oct 2015 10:55:25 +0000
Subject: [Buildroot] [PATCH 1/9 v2] core/pkg-generic: allow packages to
 exclude files when extracting
In-Reply-To: <8051e354081180d0e566d15f63e424eb1b4fbd23.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
 <8051e354081180d0e566d15f63e424eb1b4fbd23.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <5631FB1D.1000105@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On 10/24/2015 01:48 PM, Yann E. MORIN wrote:
> Currently, packages that need to exclude parts of the archives when
> extracting (e.g. to gain space), like gcc or toolchain-external, have to
> provide custom extract commands, just for the sake of adding a bunch of
> --exclude directives when calling tar.
> 
> Add a new variable that packages may set, to provide a space-separated
> list of patterns to exclude.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Regards,

Vincent.
