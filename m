From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jun 2016 10:57:17 +0200
Subject: [Buildroot] [PATCH] elfutils: do not override ELFUTILS_CFLAGS
 variable
In-Reply-To: <1466268206-62239-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466268206-62239-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160619105717.305ff59d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Jun 2016 17:43:26 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/elfutils/elfutils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master after re-ordering the assignments.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
