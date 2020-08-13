From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 21:59:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/cpio: fix build with gcc 10
In-Reply-To: <20200813073922.3126319-1-fontaine.fabrice@gmail.com>
References: <20200813073922.3126319-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813215946.734a8bb0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 09:39:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/22fefd9774cbd6648d67f29826f47f1978e9c069
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cpio/0001-Minor-fix.patch | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/cpio/0001-Minor-fix.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
