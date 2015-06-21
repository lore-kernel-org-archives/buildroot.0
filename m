From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:39:00 +0200
Subject: [Buildroot] [PATCH 05/10] pinentry: bump to version 0.9.4
In-Reply-To: <1434645873-26849-5-git-send-email-Vincent.Riera@imgtec.com>
References: <1434645873-26849-1-git-send-email-Vincent.Riera@imgtec.com>
 <1434645873-26849-5-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150621063900.4728e3b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 18 Jun 2015 18:44:28 +0200, Vicente Olivert Riera wrote:
> - Bump to version 0.9.4
> - Update hash file
> - Remove upstreamed patches
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/pinentry/0001-fix-include-paths.patch   |  42 ----------
>  package/pinentry/0002-qt-no-accessibility.patch | 102 ------------------------
>  package/pinentry/pinentry.hash                  |   2 +-
>  package/pinentry/pinentry.mk                    |   2 +-
>  4 files changed, 2 insertions(+), 146 deletions(-)
>  delete mode 100644 package/pinentry/0001-fix-include-paths.patch
>  delete mode 100644 package/pinentry/0002-qt-no-accessibility.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
