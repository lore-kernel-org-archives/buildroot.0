From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:32:56 +0200
Subject: [Buildroot] [PATCH 5/5] pinentry: new package
In-Reply-To: <1402062269-57018-6-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-6-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140609153256.0ecb03ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 6 Jun 2014 14:44:29 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
> Reviewed-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in            |    1 +
>  package/pinentry/Config.in   |   53 ++++++++++++++++++++++++++++++++++++++++++
>  package/pinentry/pinentry.mk |   47 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 101 insertions(+), 0 deletions(-)
>  create mode 100644 package/pinentry/Config.in
>  create mode 100644 package/pinentry/pinentry.mk

Applied, after fixing a few issues:

    [Thomas:
     - fix license version: the license is GPLv2+, not GPLv2
     - make sure the ncurses backend is selected if none of the other
       backends are selected.
     - add dependency on libiconv of the curses and gtk2 backends, needed
       in !locale configurations.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
