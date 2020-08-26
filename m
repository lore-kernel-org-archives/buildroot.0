From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:37:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libroxml: fix build with gcc 10
In-Reply-To: <20200826211755.148673-1-fontaine.fabrice@gmail.com>
References: <20200826211755.148673-1-fontaine.fabrice@gmail.com>
Message-ID: <20200826233742.19d548c5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Aug 2020 23:17:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b6ac3664d61ad826515b57c4d057b6f001b5167d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-src-roxml_mem.h-add-missing-extern.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
