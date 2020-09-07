From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:34:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/memcached: fix build with gcc 10
In-Reply-To: <20200906210402.396929-1-fontaine.fabrice@gmail.com>
References: <20200906210402.396929-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907213449.59463b23@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Sep 2020 23:04:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ba8dcdece193b91845a30cd31d3574674ec30068
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ash-fix-build-failure-against-gcc-10.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/memcached/0003-hash-fix-build-failure-against-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
