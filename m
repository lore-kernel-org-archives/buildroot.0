From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 18:58:31 +0100
Subject: [Buildroot] [PATCH] autobuild-run: remove unnecessary exceptions
In-Reply-To: <1418052861-64388-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418052861-64388-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141208185831.08a0b157@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Dec 2014 15:34:21 +0000, Vicente Olivert Riera wrote:
> br-mipsel-o32-full toolchain has been upgraded from 2014.08 to 2014.11
> and the build failures we had have been now fixed, so we don't need to
> these exceptions anymore.
> 
> Related:
>   http://lists.busybox.net/pipermail/buildroot/2014-December/114527.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  scripts/autobuild-run |    8 --------
>  1 files changed, 0 insertions(+), 8 deletions(-)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
