From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:50:57 +0200
Subject: [Buildroot] [PATCH] mpv: fix build on sparc
In-Reply-To: <1470692636-27918-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470692636-27918-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160809155057.048ffd7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 23:43:56 +0200, Thomas Petazzoni wrote:
> This commit adds a new patch for mpv that fixes the stdatomic detection
> logic so that it realizes linking against libatomic is needed on some
> architectures. This fixes the build of mpv on SPARC. The patch has been
> submitted upstream.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/f607eed9a48c4ca00db43f9d2652e615b4bd7c93/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../mpv/0002-wscript-improve-stdatomic-check.patch | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/mpv/0002-wscript-improve-stdatomic-check.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
