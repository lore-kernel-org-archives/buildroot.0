From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 22:21:59 +0200
Subject: [Buildroot] [PATCH] autobuild-run: also check for timeout
In-Reply-To: <1410207471-16986-1-git-send-email-peter@korsgaard.com>
References: <1410207471-16986-1-git-send-email-peter@korsgaard.com>
Message-ID: <20140908222159.1df4f88c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon,  8 Sep 2014 22:17:51 +0200, Peter Korsgaard wrote:
> Timeout is part of coreutils since v8, so older distributions don't have it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  scripts/autobuild-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
