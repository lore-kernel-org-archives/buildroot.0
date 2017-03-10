From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:50:59 +0100
Subject: [Buildroot] [PATCH] jasper: bump version to 2.0.12
In-Reply-To: <20170310170518.9210-1-Vincent.Riera@imgtec.com>
References: <20170310170518.9210-1-Vincent.Riera@imgtec.com>
Message-ID: <20170310215059.290c817e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 17:05:18 +0000, Vicente Olivert Riera wrote:
> Remove 0001-Disable-C-compiler-check.patch since it's already included
> in this release. Upstream commit:
> 
>   https://github.com/mdadams/jasper/commit/4212e7e826e1f72c2f01391a80667c88fa2eb517
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/jasper/0001-Disable-C-compiler-check.patch | 28 ----------------------
>  package/jasper/jasper.hash                         |  2 +-
>  package/jasper/jasper.mk                           |  2 +-
>  3 files changed, 2 insertions(+), 30 deletions(-)
>  delete mode 100644 package/jasper/0001-Disable-C-compiler-check.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
