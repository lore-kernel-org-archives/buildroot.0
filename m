From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:25:45 +0200
Subject: [Buildroot] [PATCH 1/4] package/jemalloc: drop obsolete
 valgrind dependency
In-Reply-To: <20190419124011.16721-1-fontaine.fabrice@gmail.com>
References: <20190419124011.16721-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420222545.3064d1fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Apr 2019 14:40:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> valgrind support has been removed since version 5.0.0 and
> https://github.com/jemalloc/jemalloc/commit/9a8add1510456464bc496320990ec234798bd381
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jemalloc/jemalloc.mk | 9 ---------
>  1 file changed, 9 deletions(-)

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
