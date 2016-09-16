From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 19:01:53 +0200
Subject: [Buildroot] [PATCH] breakpad: enable for uClibc
In-Reply-To: <1473900389-14633-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1473900389-14633-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160916190153.703a1cf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Sep 2016 21:46:29 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> There's nothing holding it off for uClibc-based toolchains so enable it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  Config.in                         | 3 ++-
>  package/google-breakpad/Config.in | 8 +++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
