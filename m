From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:37:29 +0200
Subject: [Buildroot] [PATCH 1/2] board/minnowboard/post-build.sh: only
 tweak /etc/inittab if available
In-Reply-To: <1472205140-739-1-git-send-email-peter@korsgaard.com>
References: <1472205140-739-1-git-send-email-peter@korsgaard.com>
Message-ID: <20160826153729.7cc729c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 11:52:19 +0200, Peter Korsgaard wrote:
> As pointed out in bug #9161, we don't always have an inittab file (if
> systemd or no init is used), so the post build script should only try to
> tweak it if present.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/minnowboard/post-build.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
