From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 20:12:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to
 2.0.0
In-Reply-To: <20191006141904.1793-1-bernd.kuhls@t-online.de>
References: <20191006141904.1793-1-bernd.kuhls@t-online.de>
Message-ID: <20191026201224.3af6948b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 16:19:04 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libopenh264/libopenh264.hash | 2 +-
>  package/libopenh264/libopenh264.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This version bump has badly broken the build on MIPS:

  http://autobuild.buildroot.net/?reason=libopenh264%

This error was not happening before. The non-MIPS failures in the list
above have already been fixed, they were related to SSP issues. But
now, it consistently fails to build on MIPS.

Could you have a look ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
