From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 15:48:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: Fix build with gcc6
In-Reply-To: <20160828111559.16653-1-bernd.kuhls@t-online.de>
References: <20160828111559.16653-1-bernd.kuhls@t-online.de>
Message-ID: <20160828154822.14854bd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 13:15:59 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/c45/c45530f34bf2074bd204c485615124df928f246c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libxmlrpc/0006-narrowing.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/libxmlrpc/0006-narrowing.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
