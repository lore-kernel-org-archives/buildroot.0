From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2016 13:35:14 +0200
Subject: [Buildroot] [PATCH] mpv: fix wayland deps
In-Reply-To: <1461842445-15685-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461842445-15685-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160428133514.43888361@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Apr 2016 08:20:45 -0300, Gustavo Zacarias wrote:
> The wayland backend requires libxkbcommon, so when wayland is available
> select it to avoid build failure and obscure dependencies. Fixes:
> http://autobuild.buildroot.net/results/ed2/ed2660361c9720e48dd5959f2711fd7f14031b0d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mpv/Config.in | 2 ++
>  package/mpv/mpv.mk    | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
