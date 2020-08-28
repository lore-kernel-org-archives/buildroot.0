From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 09:18:17 +0200
Subject: [Buildroot] [PATCH v3 1/8] support/scripts: Turn CVE check into
 a module
In-Reply-To: <20200724154356.2607639-2-gregory.clement@bootlin.com>
References: <20200724154356.2607639-1-gregory.clement@bootlin.com>
 <20200724154356.2607639-2-gregory.clement@bootlin.com>
Message-ID: <20200828091817.45e1f982@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jul 2020 17:43:49 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> In order to be able to do CVE checking outside of pkg-stat, move the
> CVE class in a module that can be used by other scripts.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  support/scripts/cve.py    | 156 ++++++++++++++++++++++++++++++++++++++
>  support/scripts/pkg-stats | 132 +-------------------------------
>  2 files changed, 160 insertions(+), 128 deletions(-)
>  create mode 100755 support/scripts/cve.py

I've improved the commit log a bit, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
