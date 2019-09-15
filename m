From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:21:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/luv: install libluv.pc.in
In-Reply-To: <20190905170731.3520-1-fontaine.fabrice@gmail.com>
References: <20190905170731.3520-1-fontaine.fabrice@gmail.com>
Message-ID: <20190915222115.691add0a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Sep 2019 19:07:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Archive 1.30.1-0 doesn't contain libluv.pc.in which will break the build
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5ec6b5a3622c343f7e401b7da7d4a1da15be2733
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/luv/libluv.pc.in | 12 ++++++++++++
>  package/luv/luv.mk       |  6 ++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/luv/libluv.pc.in

Applied to master, thanks. I've extended the commit log to mention that
the issue has been fixed upstream in
https://github.com/luvit/luv/commit/946784fba047bcd275554b5040949e3d70994b30.
So we need to remember to drop the hack/workaround when luv will be
bumped next time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
