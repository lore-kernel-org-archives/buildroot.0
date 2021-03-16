From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:49:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/proftpd: fix build with gcc 10
In-Reply-To: <20210315063410.991675-1-fontaine.fabrice@gmail.com>
References: <20210315063410.991675-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316214939.689ae245@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 07:34:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/d6ce64245c2724cbd94583490bf009c188182b1b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...tab-fix-build-failure-against-gcc-10.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
