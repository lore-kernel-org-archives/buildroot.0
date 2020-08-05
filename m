From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:12:10 +0200
Subject: [Buildroot] [PATCH] package/valgrind: bump version to 3.16.1
In-Reply-To: <20200805151511.562674-1-buildroot@heine.tech>
References: <20200805151511.562674-1-buildroot@heine.tech>
Message-ID: <20200805231210.1a4d79a9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Aug 2020 17:15:10 +0200
Michael Nosthoff <buildroot@heine.tech> wrote:

> * 3.16.1 fixes two critical bugs discovered after 3.16.0 was frozen.
>   for details see [1].
> * changed SITE from ftp to https.
> 
> [1] https://www.valgrind.org/docs/manual/dist.news.html
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/valgrind/valgrind.hash | 4 ++--
>  package/valgrind/valgrind.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
