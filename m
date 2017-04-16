From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 11:01:19 +0200
Subject: [Buildroot] [PATCH 1/1] rtl8821au: bump to latest
In-Reply-To: <20170415173320.14802-1-christian@paral.in>
References: <20170415173320.14802-1-christian@paral.in>
Message-ID: <20170416110119.7a7923b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Apr 2017 13:33:20 -0400, Christian Stewart wrote:
> Two CFLAGS are added: -Wno-unused-function and -Wno-unused-variable.
> 
> These warnings are disabled due to several unused functions and
> variables in the codebase that cause build failures with the
> -Wall -Werror flags enabled in rtl8821au.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/rtl8821au/rtl8821au.hash | 2 +-
>  package/rtl8821au/rtl8821au.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

As suggested by Baruch, I've changed to use -Wno-error instead of
disabling specific warnings, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
