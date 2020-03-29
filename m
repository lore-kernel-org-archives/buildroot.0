From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:56:49 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/ghostscript: add optional
 dependency to jbig2dec
In-Reply-To: <20191106211005.16734-1-bernd.kuhls@t-online.de>
References: <20191106211005.16734-1-bernd.kuhls@t-online.de>
Message-ID: <20200329225649.4ec47c48@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Nov 2019 22:10:04 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Remove jbig2dec source files included in upstream tarball as well.
> 
> Needs http://patchwork.ozlabs.org/patch/1161981/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ghostscript/ghostscript.mk | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
