From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:25:45 +0100
Subject: [Buildroot] [PATCH] package/systemd-bootchart: fix build w/
 glibc 2.26
In-Reply-To: <20171127154352.25169-1-yann.morin.1998@free.fr>
References: <20171127154352.25169-1-yann.morin.1998@free.fr>
Message-ID: <20171127212545.3717f2fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 16:43:52 +0100, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/7f7af0d41120626edbbca839c9fdbb5c6bd259c2/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-parse-util-Don-t-use-xlocale.h-35.patch   | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
