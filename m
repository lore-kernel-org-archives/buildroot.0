From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 21:34:21 +0100
Subject: [Buildroot] [PATCH 1/1] bdwgc: bump to version 8.0.0
In-Reply-To: <20181102084014.7086-1-fontaine.fabrice@gmail.com>
References: <20181102084014.7086-1-fontaine.fabrice@gmail.com>
Message-ID: <20181102213421.6d0aee2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Nov 2018 09:40:14 +0100, Fabrice Fontaine wrote:
> - Remove first patch (already in version):
>   https://github.com/ivmai/bdwgc/commit/7c13fb8fccdebfa4bf9a11abf6fa1619c5902828
> - Remove second patch (already in version)
> - Update license hash: Update header copyright (add Ivan Maidanski), see
>   https://github.com/ivmai/bdwgc/commit/3bd265a64b612af9d906b73394f2adb161bd0dec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...d-check-for-NO_GETCONTEXT-definition.patch | 28 ---------------
>  ...s-unknown-error-in-brief_async_signa.patch | 35 -------------------
>  package/bdwgc/bdwgc.hash                      |  4 +--
>  package/bdwgc/bdwgc.mk                        |  2 +-
>  4 files changed, 3 insertions(+), 66 deletions(-)
>  delete mode 100644 package/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
>  delete mode 100644 package/bdwgc/0002-Fix-size-of-tv-is-unknown-error-in-brief_async_signa.patch

Applied to master, thanks. I have sent a follow-up patch that drops
<pkg>_AUTORECONF, it would be nice if you could review/test (it works
for me, but a double check would be nice). Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
