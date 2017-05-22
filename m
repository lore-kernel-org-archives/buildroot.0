From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:38:41 +0200
Subject: [Buildroot] [PATCH next] xenomai: bump version to 3.0.5
In-Reply-To: <20170522095358.20262-1-Vincent.Riera@imgtec.com>
References: <20170522095358.20262-1-Vincent.Riera@imgtec.com>
Message-ID: <20170522153841.06bd2d70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 10:53:58 +0100, Vicente Olivert Riera wrote:
> Patch 0001 already included in this release:
>   https://git.xenomai.org/xenomai-3.git/commit/?id=3fa4dcdc397c35d27b67534c04e0ffb6e9d6d1d2
> 
> Patch 0002 already included in this release:
>   https://git.xenomai.org/xenomai-3.git/commit/?id=4c593544d2ff39ba6631cc3fa0b91493973674d4
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  .../xenomai/0001-arm-enable-armv5tej-support.patch |  32 ---
>  ...plate-build-obstack-support-conditionally.patch | 283 ---------------------
>  package/xenomai/xenomai.hash                       |   2 +-
>  package/xenomai/xenomai.mk                         |   2 +-
>  4 files changed, 2 insertions(+), 317 deletions(-)
>  delete mode 100644 package/xenomai/0001-arm-enable-armv5tej-support.patch
>  delete mode 100644 package/xenomai/0002-boilerplate-build-obstack-support-conditionally.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
