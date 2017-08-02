From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 17:32:11 +0200
Subject: [Buildroot] [PATCH 2/3] package/samba4: add optional dependency
 to dbus
In-Reply-To: <20170723133620.13487-2-bernd.kuhls@t-online.de>
References: <20170723133620.13487-1-bernd.kuhls@t-online.de>
 <20170723133620.13487-2-bernd.kuhls@t-online.de>
Message-ID: <20170802173211.04e7ce50@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 15:36:19 +0200, Bernd Kuhls wrote:
> samba4 picks up dbus as dependency if it was built before:
> 
> Checking for dbus                : yes
> Checking for header dbus/dbus.h  : yes
> Checking for library dbus-1      : yes
> 
> There is no configure option to control dbus support so we just make
> sure dbus is built before samba4 to have reproducible builds.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/samba4.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
