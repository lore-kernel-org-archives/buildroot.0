From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:48:42 +0200
Subject: [Buildroot] [PATCH 5/7 RFC] package/open2300: switch to github
In-Reply-To: <9fde96887f873a7edf7a990e6e3cfd3fa97158a0.1601329249.git.yann.morin.1998@free.fr>
References: <cover.1601329249.git.yann.morin.1998@free.fr>
 <9fde96887f873a7edf7a990e6e3cfd3fa97158a0.1601329249.git.yann.morin.1998@free.fr>
Message-ID: <20200930214842.5f3f26a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Sep 2020 23:41:01 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Upstream repository has been dead for quite a while now, and in fact
> we are using s.b.o as the "official" location now.
> 
> There however exists a Github repository, which is still ive. That
> repository has not been touched in a looooong while, but it's still
> up, and there is a revision which actually gives the exact same
> content (although the hash changes, because the directory name has
> changed, from open2300-12/ to open2300-f2198.../).
> 
> Also fix spaces in hash file.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/open2300/open2300.hash | 6 ++----
>  package/open2300/open2300.mk   | 5 ++---
>  2 files changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
