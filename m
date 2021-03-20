From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:03:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/janet: fix build without threads
In-Reply-To: <20210319212737.353274-1-fontaine.fabrice@gmail.com>
References: <20210319212737.353274-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320210336.7167a03c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Mar 2021 22:27:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of janet without threads which is broken since its addition
> in commit 9a5c9c058cbb250cfb9519347507a030e157ed16
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dd894a7178a395ea29912804132b1516934e8fa3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eson.build-fix-build-without-threads.patch | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 package/janet/0003-meson.build-fix-build-without-threads.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
