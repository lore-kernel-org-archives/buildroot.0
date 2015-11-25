From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 15:31:00 +0100
Subject: [Buildroot] [PATCH next] xfsprogs: bump version to 4.3.0
In-Reply-To: <1448450362-56560-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448450362-56560-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151125153100.2e08be46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 25 Nov 2015 11:19:22 +0000, Vicente Olivert Riera wrote:
> - Bump version to 4.3.0
> - Update hash value
> - Add new mandatory blkid dependency
> - Remove upstreamed patch:
>   0001-xfsprogs-replaces-static-with-static-libtool-libs.patch
> - Add new patch which has been sent upstream:
>   0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...o-not-do-dynamic-linking-of-libtool-libra.patch |  40 +++++++
>  ...-replaces-static-with-static-libtool-libs.patch | 129 ---------------------
>  package/xfsprogs/Config.in                         |   1 +
>  package/xfsprogs/xfsprogs.hash                     |   4 +-
>  package/xfsprogs/xfsprogs.mk                       |   2 +-
>  5 files changed, 44 insertions(+), 132 deletions(-)
>  create mode 100644 package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
>  delete mode 100644 package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
