From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:47:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix build on sparc
In-Reply-To: <20210720204319.79578-1-fontaine.fabrice@gmail.com>
References: <20210720204319.79578-1-fontaine.fabrice@gmail.com>
Message-ID: <20210720224706.4c2574e4@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 22:43:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure on sparc which is raised since bump to
> version 2021-06-R1 in commit 5e3a1e6c7cc3e42b222ecbe30b9afaaa9d6b1c33
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/38f20816a654894c0625f00b1360c92fdc251e8b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-nrf_51822.h-fix-build-on-sparc.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/kismet/0001-nrf_51822.h-fix-build-on-sparc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
