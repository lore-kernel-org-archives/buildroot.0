From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:59:25 +0100
Subject: [Buildroot] [PATCH] package/setools: drop path prefix from man
 install
In-Reply-To: <1543461118-61712-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1543461118-61712-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181129225925.3419a785@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Nov 2018 21:11:58 -0600, Matt Weber wrote:
> For this man file install scenario, joining the sys.prefix makes the
> path absolute (this was previously working by accident).  It was
> found when e94280e5a537b "package/pkg-python: use proper --prefix
> and --root values" was merged.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e214e1a539cdac07028fb58c3822f89886d86f1f
> 
> Upstream:
> https://github.com/SELinuxProject/setools/pull/13/commits/bc36cba1393120e65bfe4d0f642fd8d38010c0f7
> 
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...etup.py-drop-path-prefix-from-man-install.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
