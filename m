From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 22:42:03 +0200
Subject: [Buildroot] [PATCH] packages/devmem2: remove from all board
 configurations
In-Reply-To: <20190812181207.25287-1-unixmania@gmail.com>
References: <20190812181207.25287-1-unixmania@gmail.com>
Message-ID: <20190812224203.6b6aca8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Aug 2019 15:12:07 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> It is not used by any other application selected by those defconfigs.
> 
> Tested building all boards and searching recursively for devmem2 in the
> target directory.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Ciro Santilli <ciro.santilli@gmail.com>
> ---
> Found while investigating https://bugs.busybox.net/show_bug.cgi?id=10171

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
