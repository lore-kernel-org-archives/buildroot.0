From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:48:56 +0200
Subject: [Buildroot] [PATCH v6 2/2] cmake: bump version to 3.8.2
In-Reply-To: <20170602101641.63979-2-Vincent.Riera@imgtec.com>
References: <20170602101641.63979-1-Vincent.Riera@imgtec.com>
 <20170602101641.63979-2-Vincent.Riera@imgtec.com>
Message-ID: <20170606224856.2a25d6c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Jun 2017 11:16:41 +0100, Vicente Olivert Riera wrote:
> cmake depends on rhash, but host-cmake doesn't. This is because we use
> the bundled dependencies for host-cmake but not for target.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v5 -> v6:
> - Bump version to 3.8.2
> Changes v4 -> v5:
> - Nothing
> Changes v3 -> v4:
> - Nothing
> Changes v2 -> v3:
> - Bump version to 3.8.1
> - Change LIBRHASH references to RHASH
> Changes v1 -> v2:
> - Added explanation in the commit log about why rhash dependency is
>   needed for cmake but not for host-cmake. (Arnout)
> ---
>  package/cmake/Config.in  | 1 +
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
