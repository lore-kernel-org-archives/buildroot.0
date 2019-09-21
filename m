From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 23:05:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: drop unneeded patch
In-Reply-To: <20190921202534.27238-1-fontaine.fabrice@gmail.com>
References: <20190921202534.27238-1-fontaine.fabrice@gmail.com>
Message-ID: <20190921230557.1382ea93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Sep 2019 22:25:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch is not needed since version 0.21.2 and
> https://github.com/p11-glue/p11-kit/commit/bf8dfa9f33c1aa8d76f8d1ae6cf79afb90497cd4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ainst-older-pthreads-implementations.patch | 64 -------------------
>  1 file changed, 64 deletions(-)
>  delete mode 100644 package/p11-kit/0001-Fix-build-against-older-pthreads-implementations.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
