From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:18:11 +0200
Subject: [Buildroot] [PATCH] package/python: fix sqlite3 extension
 without threads
In-Reply-To: <1405167112-9063-1-git-send-email-yann.morin.1998@free.fr>
References: <1405167112-9063-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140715191811.487b84ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 12 Jul 2014 14:11:52 +0200, Yann E. MORIN wrote:
> Fix a compiler error when building the sqlite3 extension, when the
> toolchain does not have threads.
> 
> Fixes:
>         http://autobuild.buildroot.net/results/10f/10f268cd55f16ee53f4c5e17e1248b0a1820f6ea/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../python-015-fix-sqlite-without-threads.patch    | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/python/python-015-fix-sqlite-without-threads.patch

Applied, thanks. Do you know if Python 3 is affected as well?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
