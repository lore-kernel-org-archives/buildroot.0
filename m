From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:08:00 +0100
Subject: [Buildroot] [PATCH v2] package/enlightenment: remove uClibc
 0.9.33 workaround
In-Reply-To: <1481405348-25992-1-git-send-email-romain.naour@gmail.com>
References: <1481405348-25992-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161211150800.5827641b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 22:29:08 +0100, Romain Naour wrote:
> This workaround was added for uClibc <= 0.9.33.2 by commit [1].
> This issue has been fixed long time ago in uClibc-ng for powerpc [2], sparc and
> xtensa [3].
> 
> Nowadays, enlightenment can't be selected for xtensa ans sparc due to luajit
> dependency from the efl stack and uClibc 0.9.33 was removed from Buildroot
> since 2016.02 release.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=37acd25ee1376de5734415ac60be16991ee6d150
> [2] http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=90298bc4fb1303151d6213d13beefcf9b378c5e1
> [3] https://git.buildroot.net/buildroot/commit/?id=0b056944f5878304f51af3e9edb6d596f24fc370
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: improve the commit log.
> ---
>  package/enlightenment/enlightenment.mk | 5 -----
>  1 file changed, 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
