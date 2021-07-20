From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:41:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.6.6
In-Reply-To: <20210701174729.82981-1-bernd.kuhls@t-online.de>
References: <20210701174729.82981-1-bernd.kuhls@t-online.de>
Message-ID: <20210720224103.6c2e71ca@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  1 Jul 2021 19:47:29 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://blog.torproject.org/node/2046
> 
> Removed patch which was applied upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0002-Fix-compilation-on-systems-with.patch | 47 -------------------
>  package/tor/tor.hash                          |  2 +-
>  package/tor/tor.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/tor/0002-Fix-compilation-on-systems-with.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
