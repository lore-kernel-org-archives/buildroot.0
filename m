From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 23:25:48 +0200
Subject: [Buildroot] [PATCH 1/3] tmux: bump to 2.0
In-Reply-To: <1434569303-2383-1-git-send-email-yegorslists@googlemail.com>
References: <1434569303-2383-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150618232548.067b016c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Wed, 17 Jun 2015 21:28:21 +0200, Yegor Yefremov wrote:
> Add new location as tmux moved to GitHub.
> 
> Remove the patch as it was already merged upstream.
> Remove related AUTORECONF as well.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...01-Makefile.am-remove-unsafe-headers-path.patch | 35 ----------------------
>  package/tmux/tmux.hash                             |  2 +-
>  package/tmux/tmux.mk                               |  7 ++---
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/tmux/0001-Makefile.am-remove-unsafe-headers-path.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
