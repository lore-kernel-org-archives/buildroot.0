From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 22:07:35 +0100
Subject: [Buildroot] [PATCH 1/2] fluxbox: do not autoreconf
In-Reply-To: <1420566154-43239-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1420566154-43239-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150106220735.25228f70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 6 Jan 2015 17:42:33 +0000, Vicente Olivert Riera wrote:
> There is no need to have "AUTORECONF = YES" since the patch which
> modified the "configure.in" file was removed in the last version bump.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/fluxbox/fluxbox.mk |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)

Both applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
