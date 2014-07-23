From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:36:05 +0200
Subject: [Buildroot] [PATCH 1/5] pth: new package
In-Reply-To: <1402062269-57018-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140723233605.1d254b04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 6 Jun 2014 14:44:25 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
> ---
>  package/Config.in                               |    1 +
>  package/pth/Config.in                           |   10 +++
>  package/pth/pth-001-disable-documentation.patch |   74 +++++++++++++++++++++++
>  package/pth/pth.mk                              |   28 +++++++++
>  4 files changed, 113 insertions(+), 0 deletions(-)
>  create mode 100644 package/pth/Config.in
>  create mode 100644 package/pth/pth-001-disable-documentation.patch
>  create mode 100644 package/pth/pth.mk

As explained in my reply to the gnupg2 package, this pth package is not
needed, since pthsem has a --enable-compat option to enable
compatibility with the old pth library.

Therefore, I've marked this patch as Rejected in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
