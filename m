From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 23:45:32 +0200
Subject: [Buildroot] [PATCH] package/powertop: bump version to 2.13
In-Reply-To: <20200828094639.1285-1-sergio.prado@e-labworks.com>
References: <20200828094639.1285-1-sergio.prado@e-labworks.com>
Message-ID: <20200828234532.0060174a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Aug 2020 06:46:39 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Also separate the fields in the hash file by two spaces and add pgp
> signature check.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/powertop/powertop.hash | 8 +++++---
>  package/powertop/powertop.mk   | 4 ++--
>  2 files changed, 7 insertions(+), 5 deletions(-)

I've applied to next, after dropping the POWERTOP_SOURCE variable.
Indeed, the new value of that variable was the default value, and this
is reported by "make check-package" as a coding style issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
