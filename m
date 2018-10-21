From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:35:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 11.0
In-Reply-To: <20181020221056.10473-1-bernd.kuhls@t-online.de>
References: <20181020221056.10473-1-bernd.kuhls@t-online.de>
Message-ID: <20181021163559.4969c385@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Oct 2018 00:10:56 +0200, Bernd Kuhls wrote:
> Release notes: https://www.postgresql.org/about/news/1894/
> 
> Added md5 hash provided by upstream.
> 
> To fix build errors "MAKELEVEL=0" is required by upstream in MAKE_OPTS:
> https://www.postgresql-archive.org/BUG-15407-minor-build-depends-on-MAKELEVEL-being-0-at-top-Makefile-td6047685.html#a6047709
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/postgresql/postgresql.hash | 6 ++++--
>  package/postgresql/postgresql.mk   | 4 +++-
>  2 files changed, 7 insertions(+), 3 deletions(-)

I added a comment in the .mk file to explain the MAKELEVEL=0, because
this is really weird. And then I applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
