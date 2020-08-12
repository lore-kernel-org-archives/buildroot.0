From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:46:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/aircrack-ng: fix build with gcc
 10
In-Reply-To: <20200811084207.1355635-1-fontaine.fabrice@gmail.com>
References: <20200811084207.1355635-1-fontaine.fabrice@gmail.com>
Message-ID: <20200812164631.5bdad886@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Aug 2020 10:42:07 +0200
Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/98ab591a88e06a985b0a7aac5abbf665289134b4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Expand-packed-definition.patch       | 26 +++++++
>  .../0002-Fix-duplicated-symbols.patch         | 74 +++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 package/aircrack-ng/0001-Expand-packed-definition.patch
>  create mode 100644 package/aircrack-ng/0002-Fix-duplicated-symbols.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
