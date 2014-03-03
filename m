From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 21:21:13 +0100
Subject: [Buildroot] [PATCH 4/4] systemd: uclibc now has
 posix_fallocate()
In-Reply-To: <1386547663-2678-4-git-send-email-shawn@churchofgit.com>
References: <1386547663-2678-1-git-send-email-shawn@churchofgit.com>
 <1386547663-2678-4-git-send-email-shawn@churchofgit.com>
Message-ID: <20140303212113.6a1d1066@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Shawn Landden,

On Sun,  8 Dec 2013 16:07:43 -0800, Shawn Landden wrote:
> uClibc commit 5643900913f64c00f1c29589145
> 
> Signed-off-by: Shawn Landden <shawn@churchofgit.com>
> ---
>  package/systemd/systemd-uclibc-fix.patch | 18 ------------------
>  1 file changed, 18 deletions(-)

Thanks, but we have now bumped systemd to version 207, and this new
version caused too much problems with uClibc, so we've made it depend
on (e)glibc. As a consequence, your patch is no longer necessary.

Do not hesitate to let us know if the new systemd version works for you.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
