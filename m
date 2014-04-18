From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 23:52:59 +0200
Subject: [Buildroot] [PATCH] qt5base: Remove feature test for
 posix_fallocate in sqlite code
In-Reply-To: <1397807099-1489-1-git-send-email-fatih.asici@gmail.com>
References: <1397807099-1489-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <20140418235259.0ba69918@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

On Fri, 18 Apr 2014 10:44:59 +0300, Fatih A??c? wrote:
> It's already checked by the build system more accurately.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e3b/e3b26ee314880fdb50bb774a0539bfba04d9fbcf/
> 
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  ...not-check-feature-macros-for-posix_falloc.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/qt5/qt5base/qt5base-0006-sqlite3-Do-not-check-feature-macros-for-posix_falloc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
