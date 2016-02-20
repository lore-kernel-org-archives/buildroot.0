From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:09:24 +0100
Subject: [Buildroot] [PATCH 1/1] tmux: bump to version 2.1
In-Reply-To: <1455938699-19463-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1455938699-19463-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20160220140924.65f17bf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ricardo Martincoski,

On Sat, 20 Feb 2016 01:24:59 -0200, Ricardo Martincoski wrote:
> Add patch to fix musl build by removing inclusion of sys/cdefs.h.
> Patch was backported from upstream master and can be dropped in the
> next version bump.
> 
> Update homepage link
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/tmux/0001-remove-use-of-sys-cdefs.h.patch | 42 +++++++++++++++++++++++
>  package/tmux/Config.in                            |  2 +-
>  package/tmux/tmux.hash                            |  2 +-
>  package/tmux/tmux.mk                              |  2 +-
>  4 files changed, 45 insertions(+), 3 deletions(-)
>  create mode 100644 package/tmux/0001-remove-use-of-sys-cdefs.h.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
