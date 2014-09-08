From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 22:11:31 +0200
Subject: [Buildroot] [PATCH-AUTOBUILD] autobuild-run: introduce
 SystemInfo class and use it to disable packages needing unavailable system
 deps
In-Reply-To: <1410182196-19849-1-git-send-email-peter@korsgaard.com>
References: <1410182196-19849-1-git-send-email-peter@korsgaard.com>
Message-ID: <20140908221131.0ade1f8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon,  8 Sep 2014 15:16:36 +0200, Peter Korsgaard wrote:
> Some autobuilders don't have all optional system dependencies available
> (E.G.  bzr), and some _do_ have java/javac/jar, so it would be interesting
> to build the packages requiring these if possible.
> 
> Handle this variability by detecting these dependencies at startup adjust
> fixup_config based on availability.
> 
> Also cleanup fixup_config to look for the BR2_NEEDS_HOST_* config lines
> instead of the specific packages that (today) needs them.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  scripts/autobuild-run | 45 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 9 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
