From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:29:12 +0200
Subject: [Buildroot] [PATCH 4/8 v11] package/xserver_xorg-server: not
 all versions need all dependencies
In-Reply-To: <4ef114d646d13c6c519a2c858473ff8d19c60130.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <4ef114d646d13c6c519a2c858473ff8d19c60130.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426222912.78a62538@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:04:40 +0200, Yann E. MORIN wrote:
> Support for the Present protocol has been added to, and is mandatory
> since version 1.15.
> 
> As we're on the verge of adding 1.14.7, we need to make Present a
> version-specific dependency.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xserver_xorg-server/Config.in              | 2 +-
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 ++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
