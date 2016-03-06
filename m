From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 15:48:05 +0100
Subject: [Buildroot] [PATCH 3/3] luaposix: bump to version 33.4.0
In-Reply-To: <1457039566-3326-3-git-send-email-francois.perrad@gadz.org>
References: <1457039566-3326-1-git-send-email-francois.perrad@gadz.org>
 <1457039566-3326-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160306154805.21d478f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu,  3 Mar 2016 22:12:46 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...round-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch | 59 ----------------------
>  package/luaposix/Config.in                         | 12 ++---
>  package/luaposix/luaposix.mk                       |  6 +--
>  3 files changed, 7 insertions(+), 70 deletions(-)
>  delete mode 100644 package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch

I've applied, but I almost rejected the patch, to be honest. Your patch
does a *lot* more than bumping the version, but your commit log is
empty. Your commit log should have explained why the patch is removed,
and why the ncurses dependency is removed.

I had to go look up for this myself, which is a bit annoying since you
already did this work.

Fran?ois, this is the 100th time I'm asking you about this: please
*ALWAYS* write a commit log in your patches. *ALWAYS*.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
