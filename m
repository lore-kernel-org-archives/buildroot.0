From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:11:44 +0200
Subject: [Buildroot] [PATCH 1/3] dhcpdump: add $(TARGET_MAKE_ENV) before
 $(MAKE)
In-Reply-To: <1445349954-44062-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445349954-44062-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151021221144.52dec2ca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 20 Oct 2015 15:05:52 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/dhcpdump/dhcpdump.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Applied after slightly tweaking the commit log following Peter's
comment, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
