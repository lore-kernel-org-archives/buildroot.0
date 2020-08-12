From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:46:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/atest: fix build with gcc 10
In-Reply-To: <20200811082516.1189869-1-fontaine.fabrice@gmail.com>
References: <20200811082516.1189869-1-fontaine.fabrice@gmail.com>
Message-ID: <20200812164614.6fa010ff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Aug 2020 10:25:16 +0200
Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/887c466b3703449239eedaf86f3f4dd2a2dc8afe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-seq.h-fix-build-with-gcc-10.patch    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/atest/0001-seq.h-fix-build-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
