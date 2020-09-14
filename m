From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 21:21:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix tarball name in
 hash file
In-Reply-To: <20200914171659.3364205-1-fontaine.fabrice@gmail.com>
References: <20200914171659.3364205-1-fontaine.fabrice@gmail.com>
Message-ID: <20200914212125.2ed1a258@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 19:16:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 819a4207f6a5c3b579cb5191b03b51ebec4298ff forgot to rename
> libuhttpd-3.2.0.tar.gz
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/965be1c72996df94668be81d1e90ed6937fb9a7c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuhttpd/libuhttpd.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
