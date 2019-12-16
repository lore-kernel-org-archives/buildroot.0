From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 21:28:44 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/harfbuzz: bump version to
 2.6.1
In-Reply-To: <20190825181620.7976-1-bernd.kuhls@t-online.de>
References: <20190825181620.7976-1-bernd.kuhls@t-online.de>
Message-ID: <20191216212844.24554101@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Aug 2019 20:16:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/harfbuzz/harfbuzz.hash | 4 ++--
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I've applied to master with the following changes:

    [Thomas:
     - drop patch 0001-pool-Fix-alignment-assertion.patch, which is in
       upstream commit aade9b70aabd8a97dd8a28cda2cf4d0694dd7350, available
       since version 2.6.0
     - further bump to 2.6.4]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
