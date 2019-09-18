From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 17:51:53 +0200
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.93.2
In-Reply-To: <15bc17dc2c64d8655115f0bcd9b640d05e7fe6aa.1568819220.git.baruch@tkos.co.il>
References: <15bc17dc2c64d8655115f0bcd9b640d05e7fe6aa.1568819220.git.baruch@tkos.co.il>
Message-ID: <20190918175153.7b2c6a22@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Sep 2019 18:07:00 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> New upstream at github. Update homepage link and download site.
> 
> Drop the custom extract command; we now get the source tree from github.
> 
> Drop patch #2; the code detects rpc support.
> 
> Add optional dependency on libtirpc.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lsof/0002-noportmap.patch              | 18 ------------------
>  ...atch => 0002-remove-susvlegacy-funcs.patch} |  0
>  package/lsof/Config.in                         |  2 +-
>  package/lsof/lsof.hash                         |  8 ++------
>  package/lsof/lsof.mk                           | 17 ++++++-----------
>  5 files changed, 9 insertions(+), 36 deletions(-)
>  delete mode 100644 package/lsof/0002-noportmap.patch
>  rename package/lsof/{0004-remove-susvlegacy-funcs.patch => 0002-remove-susvlegacy-funcs.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
