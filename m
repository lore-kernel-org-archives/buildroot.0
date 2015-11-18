From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:55:20 +0100
Subject: [Buildroot] [PATCH next 1/2] package/*: test for
 BR2_PACKAGE_LIBGUDEV for dependency
In-Reply-To: <fe0244022307f4d80793175f3d433c3e4ae9b738.1447875520.git.baruch@tkos.co.il>
References: <fe0244022307f4d80793175f3d433c3e4ae9b738.1447875520.git.baruch@tkos.co.il>
Message-ID: <20151118215520.76ee0f5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 18 Nov 2015 21:38:39 +0200, Baruch Siach wrote:
> Make the case of adding libgudev as a dependency more consistent with all
> other dependency packages. The <pkg>_DEPENDENCIES variable sets the build
> order which is conceptually independent of the underlying reason for that
> dependency.
> 
> Also, remove the comments in hidapi.mk and udisks.mk. These comments explain
> why BR2_PACKAGE_LIBGUDEV is selected, so the comments in corresponding
> Config.in files are enough.
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/hidapi/hidapi.mk                   | 7 +------
>  package/libmbim/libmbim.mk                 | 2 +-
>  package/modem-manager/modem-manager.mk     | 2 +-
>  package/network-manager/network-manager.mk | 2 +-
>  package/udisks/udisks.mk                   | 7 +------
>  5 files changed, 5 insertions(+), 15 deletions(-)

Both patches applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
