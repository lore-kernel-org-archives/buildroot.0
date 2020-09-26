From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:34:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/socketcand: fix build with gcc
 10
In-Reply-To: <20200925214344.3723600-1-fontaine.fabrice@gmail.com>
References: <20200925214344.3723600-1-fontaine.fabrice@gmail.com>
Message-ID: <20200926153422.08a3b66d@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Sep 2020 23:43:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Also update socketcand.hash as the patch is updating socketcand.c
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a72f3e34c161a012e8091db331d02bbf2da6ad94
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-GCC10-build-failure.patch        | 113 ++++++++++++++++++
>  package/socketcand/socketcand.hash            |   2 +-
>  2 files changed, 114 insertions(+), 1 deletion(-)
>  create mode 100644 package/socketcand/0001-Fix-GCC10-build-failure.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
