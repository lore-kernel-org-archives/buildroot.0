From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 15:00:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build on m68k
In-Reply-To: <20190814212045.27140-1-bernd.kuhls@t-online.de>
References: <20190814212045.27140-1-bernd.kuhls@t-online.de>
Message-ID: <20190815150056.1c1b928f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Aug 2019 23:20:45 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/b54/b54cf80fb8f09c6d4837e987657254d902a90ac1/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Another solution for the compile error would be to bump harfbuzz to
> 2.6.0, but this bump will add new features along with bugfixes:
> https://github.com/harfbuzz/harfbuzz/releases

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
