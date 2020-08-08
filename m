From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:50:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/minizip: fix build with gcc 4.8
In-Reply-To: <20200725214545.866978-1-fontaine.fabrice@gmail.com>
References: <20200725214545.866978-1-fontaine.fabrice@gmail.com>
Message-ID: <20200808235027.7efee07d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 23:45:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b8baff4b86923d29163ce5cc9e391904d81fc90c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-mz.h-fix-build-with-gcc-4.8.patch    | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/minizip/0002-mz.h-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
