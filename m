From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 14:44:20 +0200
Subject: [Buildroot] [PATCH] package/dc3dd: fix build with NLS enabled
In-Reply-To: <20170402090402.32233-1-yann.morin.1998@free.fr>
References: <20170402090402.32233-1-yann.morin.1998@free.fr>
Message-ID: <20170402144420.55a9c0d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 11:04:02 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/56e/56eda8289118782de7b8b33f956bfb33b159b86a/
>     http://autobuild.buildroot.org/results/b8b/b8b59ab00790ff1b29fb72852e05ef8b402f41ec/
>     http://autobuild.buildroot.org/results/ef5/ef581cc3cae46a6ed08c321b575b71e6a384cced/
>     [...and a lot more...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Beno?t Allard <benoit.allard@greenbone.net>
> 
> ---
> This one was hard to reproduce, because it would not happen when simply
> calling "make dc3dd" alone. A plain "make" was required, to trigger a
> hidden dependency, which I am now hunting down...
> ---
>  .../dc3dd/0003-po-fix-build-with-NLS-enabled.patch | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/dc3dd/0003-po-fix-build-with-NLS-enabled.patch

Applied to master, thanks. I have to say I hate this package and how
many build failures it has caused :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
