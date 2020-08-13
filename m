From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 21:58:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/bellagio: fix build with gcc 10
In-Reply-To: <20200812202508.2874057-1-fontaine.fabrice@gmail.com>
References: <20200812202508.2874057-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813215847.51b7e20c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Aug 2020 22:25:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/0c02f845eabfbc276ee5989520a3c77fc47289ab
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e_resource_manager.-h-c-fix-build-wi.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/bellagio/0006-src-omx_reference_resource_manager.-h-c-fix-build-wi.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
