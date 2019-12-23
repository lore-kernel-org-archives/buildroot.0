From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:05:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/twolame: bump to version 0.4.0
In-Reply-To: <20191222223721.3982310-1-fontaine.fabrice@gmail.com>
References: <20191222223721.3982310-1-fontaine.fabrice@gmail.com>
Message-ID: <20191223210504.7fe7393a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 23:37:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update hash of license file (trailing whitespace removed:
>   https://github.com/njh/twolame/commit/2cdcd064aa340b30209d8a0e86cef5a22394b4d5)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-Fix-static-linking-with-libmagic.patch | 228 ------------------
>  package/twolame/twolame.hash                  |   4 +-
>  package/twolame/twolame.mk                    |   2 +-
>  3 files changed, 3 insertions(+), 231 deletions(-)
>  delete mode 100644 package/twolame/0001-Fix-static-linking-with-libmagic.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
