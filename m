From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:45:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: fix build with gcc 10
In-Reply-To: <20200924203133.2031332-1-fontaine.fabrice@gmail.com>
References: <20200924203133.2031332-1-fontaine.fabrice@gmail.com>
Message-ID: <20200926154502.12c510d4@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Sep 2020 22:31:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/650fc0046fd063c70e17ce5ebd9592195657434d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../openswan/0001-fix-build-with-gcc-10.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/openswan/0001-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
