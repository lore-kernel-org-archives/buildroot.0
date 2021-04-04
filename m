From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:45:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/qhull: bump to version 8.0.2
In-Reply-To: <20210323191826.138987-1-fontaine.fabrice@gmail.com>
References: <20210323191826.138987-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404164547.4de316f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Mar 2021 20:18:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Static libs are supported since version 8.0.2 and
>   https://github.com/qhull/qhull/commit/613debeaea72ee66626dace9ba1a2eff11b5d37d
> - Update hash of COPYING, update year and authors with
>   https://github.com/qhull/qhull/commit/4733a95be0298919a646a1d6044c1bee7a552880
> - Update indentation in hash file (two spaces)
> 
> https://github.com/qhull/qhull/releases/tag/v8.0.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qhull/Config.in  |  6 +++---
>  package/qhull/qhull.hash |  8 ++++----
>  package/qhull/qhull.mk   | 15 +++++++++++++--
>  3 files changed, 20 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
