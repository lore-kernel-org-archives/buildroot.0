From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 21:36:35 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/postgresql: bump version
 to 12.3
In-Reply-To: <20200514161436.668972-1-bernd.kuhls@t-online.de>
References: <20200514161436.668972-1-bernd.kuhls@t-online.de>
Message-ID: <20200515213635.7ea153d5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 May 2020 18:14:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://www.postgresql.org/about/news/2038/
> 
> Fixes CVE-2020-10733 which is only relevant for Windows.
> 
> Reformatted hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/postgresql/postgresql.hash | 10 +++++-----
>  package/postgresql/postgresql.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
