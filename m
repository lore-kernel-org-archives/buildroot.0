From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:01:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr: fix non-portable atomics
In-Reply-To: <20190904193315.28943-1-bernd.kuhls@t-online.de>
References: <20190904193315.28943-1-bernd.kuhls@t-online.de>
Message-ID: <20190915230121.608972d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Sep 2019 21:33:15 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> apr-1.7.0 added support for 8 bytes atomics for 32 bit archs
> https://github.com/apache/apr/commit/2f61f960c81e4a45f3849baa7563812e7e526436
> 
> We need to adjust our _CONF_OPTS which fixes an apache build error.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f24/f2461c1ed542e050afd761db5faeaaff1f51775b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apr/apr.mk | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
