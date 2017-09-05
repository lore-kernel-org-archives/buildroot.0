From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 22:01:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 17.2.0
In-Reply-To: <20170904175614.14958-1-bernd.kuhls@t-online.de>
References: <20170904175614.14958-1-bernd.kuhls@t-online.de>
Message-ID: <20170905220143.62cc5aed@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 19:56:14 +0200, Bernd Kuhls wrote:
> Added dependency to wayland-protocols needed by upstream:
> https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=17.2&id=02cc359372773800de817950aebdf9be2c7973d1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/Config.in   | 1 +
>  package/mesa3d/mesa3d.hash | 7 ++-----
>  package/mesa3d/mesa3d.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
