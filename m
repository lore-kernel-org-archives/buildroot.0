From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:17:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/Makefile.in: remove
 host-cc-option macro
In-Reply-To: <20191026170614.28766-1-bernd.kuhls@t-online.de>
References: <20191026170614.28766-1-bernd.kuhls@t-online.de>
Message-ID: <20191026191730.16d87ec9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 19:06:14 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> https://git.buildroot.net/buildroot/commit/?id=91a08ecc998ae232ea6f3525540ed129d8176d18
> added a macro solely used by the aespipe package:
> https://git.buildroot.net/buildroot/commit/?id=00ecd72c28f103fc7d166f718db81a8b6c4919fa
> 
> After the latest version bump of aespipe the package does not need this
> macro anymore so we can safely remove it.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Makefile.in | 21 ---------------------
>  1 file changed, 21 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
