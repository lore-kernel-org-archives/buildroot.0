From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:44:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcue: update upstream URL
In-Reply-To: <1454163715-20488-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454163715-20488-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207154434.53ce1734@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 15:21:55 +0100, Bernd Kuhls wrote:
> According to http://sourceforge.net/projects/libcue the project moved
> to github.com, all source tarballs were removed from Sourceforge.
> 
> Adjust project and download URLs, update hash and remove
> 0001-_unused-fix.patch because there is no trace of "__unused" in the
> upstream tarball anymore, the patch fails to apply.
> 
> Add autoreconf because the new upstream tarball does not contain a
> configure script, autoreconf also needs a tweak because it fails when
> config/ is not present.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libcue/0001-_unused-fix.patch | 50 -----------------------------------
>  package/libcue/Config.in              |  2 +-
>  package/libcue/libcue.hash            |  2 +-
>  package/libcue/libcue.mk              | 12 ++++++---
>  4 files changed, 11 insertions(+), 55 deletions(-)
>  delete mode 100644 package/libcue/0001-_unused-fix.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
