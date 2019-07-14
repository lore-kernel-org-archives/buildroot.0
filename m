From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:07:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: bump to version
 5.43
In-Reply-To: <20190707150112.1856-1-fontaine.fabrice@gmail.com>
References: <20190707150112.1856-1-fontaine.fabrice@gmail.com>
Message-ID: <20190714160750.02c823b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jul 2019 17:01:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (not needed anymore)
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-fix-cross-compile-ansi-c-bailout.patch | 19 -------------------
>  package/xscreensaver/xscreensaver.hash        |  4 +++-
>  package/xscreensaver/xscreensaver.mk          |  2 +-
>  3 files changed, 4 insertions(+), 21 deletions(-)
>  delete mode 100644 package/xscreensaver/0001-fix-cross-compile-ansi-c-bailout.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
