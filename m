From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 13:47:41 +0200
Subject: [Buildroot] [PATCH 1/2] heimdal: needs host-ncurses
In-Reply-To: <1436544308-22652-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436544308-22652-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150714134741.78c12bbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 10 Jul 2015 18:05:07 +0200, Vicente Olivert Riera wrote:
> Otherwise it will fail with an error like this one:
> 
> checking for tgetent in -lcurses... no
> checking for tgetent in -lncurses... no
> configure: error: libcurses or libncurses are required!
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/heimdal/heimdal.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
