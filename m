From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:45:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/dbus: drop unrecognized option
In-Reply-To: <20200920105004.1402686-1-fontaine.fabrice@gmail.com>
References: <20200920105004.1402686-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920154547.2a3006af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 12:50:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --with-xml option has been dropped seven years ago in version 1.7.4 and
> https://github.com/freedesktop/dbus/commit/46602768c537bfa51af80ba2c67857f3a30c0e67
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dbus/dbus.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
