From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 23:01:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: fix build with boost
 1.73.0
In-Reply-To: <20200814162054.1406222-1-fontaine.fabrice@gmail.com>
References: <20200814162054.1406222-1-fontaine.fabrice@gmail.com>
Message-ID: <20200814230127.4fbd846f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Aug 2020 18:20:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/0f02877a665b2281266df4b23c72a7c113906c31
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-Fix-build-with-boost-1-73.patch      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/supertux/0002-Fix-build-with-boost-1-73.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
