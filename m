From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 22:30:54 +0200
Subject: [Buildroot] [PATCH] gnupg2: Needs a suitable iconv
 implementation
In-Reply-To: <1408018572-57330-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1408018572-57330-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140815223054.62459319@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 14 Aug 2014 13:16:12 +0100, Vicente Olivert Riera wrote:
> gnupg2 needs a toolchain with locale support or a package which provides
> a suitable iconv implementation (libiconv). Otherwise it will fail at
> the configure phase with an error like this one:
> 
> *** It is now required to build with support for iconv
> *** Please install a suitable iconv implementation.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/8c9/8c93c28533dfebffa8b2e34b1421d3fa3cdeb278/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
> ---
>  package/gnupg2/Config.in |    1 +
>  package/gnupg2/gnupg2.mk |    3 ++-
>  2 files changed, 3 insertions(+), 1 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
