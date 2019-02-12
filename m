From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 11:17:42 +0100
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.25.0-0
In-Reply-To: <20190212083351.376-1-joerg.krause@embedded.rocks>
References: <20190212083351.376-1-joerg.krause@embedded.rocks>
Message-ID: <20190212111742.739bc1d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Feb 2019 09:33:51 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Remove upstream patch which is included in the new release.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...lude-compat-5.3.h-in-luv-header-file.patch | 62 -------------------
>  package/luv/luv.hash                          |  2 +-
>  package/luv/luv.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 64 deletions(-)
>  delete mode 100644 package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
