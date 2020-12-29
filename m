From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 21:12:30 +0100
Subject: [Buildroot] [PATCH] package/bluez5_utils: add SysV init script
In-Reply-To: <20201221182920.66448-1-m.niestroj@grinn-global.com>
References: <20201221182920.66448-1-m.niestroj@grinn-global.com>
Message-ID: <20201229211230.273670d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Dec 2020 19:29:20 +0100
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Use generic template for SysV init script, similar to packages like
> syslog-ng.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/bluez5_utils/S40bluetooth    | 61 ++++++++++++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk |  5 +++
>  2 files changed, 66 insertions(+)
>  create mode 100755 package/bluez5_utils/S40bluetooth

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
