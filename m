From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:34:42 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to 1.13.14
In-Reply-To: <20200717193718.621965-1-christian@paral.in>
References: <20200717193718.621965-1-christian@paral.in>
Message-ID: <20200718153442.048bc63b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jul 2020 12:37:18 -0700
Christian Stewart <christian@paral.in> wrote:

> go1.13.14 (released 2020/07/16) includes fixes to the compiler, vet, and
> the database/sql, net/http, and reflect packages.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
