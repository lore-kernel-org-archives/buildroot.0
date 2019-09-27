From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:02:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/glorytun: bump to version 2.0.1
In-Reply-To: <20190925165035.5756-1-fontaine.fabrice@gmail.com>
References: <20190925165035.5756-1-fontaine.fabrice@gmail.com>
Message-ID: <20190927230246.3bd9daea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Sep 2019 18:50:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mud/aegis256/aegis256.c:6:18: error: missing binary operator before token "("
>  #if __has_include("x86intrin.h")
>                   ^
> 
> is fixed through
> https://github.com/angt/aegis256/commit/4ff57bfc839b696cbc34651586d232ec8e1db275
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f03b0ec68e14e4562df13ce484da34115b113c02
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glorytun/glorytun.hash | 2 +-
>  package/glorytun/glorytun.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
