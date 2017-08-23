From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:46:51 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/wayland-protocols: bump
 version to 1.10
In-Reply-To: <20170822200436.24905-1-bernd.kuhls@t-online.de>
References: <20170822200436.24905-1-bernd.kuhls@t-online.de>
Message-ID: <20170823154651.75b58481@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Aug 2017 22:04:34 +0200, Bernd Kuhls wrote:
> Added all hashes provided by upstream.
> 
> Upcoming mesa3d 17.2.0 needs version >= 1.8:
> https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=17.2&id=02cc359372773800de817950aebdf9be2c7973d1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wayland-protocols/wayland-protocols.hash | 6 ++++--
>  package/wayland-protocols/wayland-protocols.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Series applied to next, with some changes on PATCH 3/3, I'll reply to
it specifically. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
