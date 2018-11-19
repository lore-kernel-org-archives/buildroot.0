From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:41:00 +0100
Subject: [Buildroot] [PATCH/next 1/1] jpeg-turbo: bump to version 2.0.1
In-Reply-To: <20181119203211.21429-1-fontaine.fabrice@gmail.com>
References: <20181119203211.21429-1-fontaine.fabrice@gmail.com>
Message-ID: <20181119214100.55738b69@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Nov 2018 21:32:11 +0100, Fabrice Fontaine wrote:
> Remove patch (already in version), see:
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/950580eb0c020598a4c6c8aa46c86e31062e1ddc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-binaries-with-a-static-only-library.patch | 42 -------------------
>  package/jpeg-turbo/jpeg-turbo.hash            |  8 ++--
>  package/jpeg-turbo/jpeg-turbo.mk              |  2 +-
>  3 files changed, 5 insertions(+), 47 deletions(-)
>  delete mode 100644 package/jpeg-turbo/0001-fix-install-of-binaries-with-a-static-only-library.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
