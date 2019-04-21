From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 22:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: fix build on or1k
 with gcc < 6
In-Reply-To: <20190421170851.26397-1-fontaine.fabrice@gmail.com>
References: <20190421170851.26397-1-fontaine.fabrice@gmail.com>
Message-ID: <20190421223232.7acc1ee2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Apr 2019 19:08:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8cb80bef5c60ac1e5f6507fbc68c21c32f4af84a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jemalloc/jemalloc.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
