From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 09:17:20 +0100
Subject: [Buildroot] [PATCH] systemd-bootchart: bump to version 233
In-Reply-To: <20171214054142.30141-1-yurovsky@gmail.com>
References: <20171214054142.30141-1-yurovsky@gmail.com>
Message-ID: <20171214091720.3fcf12ba@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 21:41:42 -0800, Andrey Yurovsky wrote:
> This version includes minor fixes and improvements but is otherwise
> compatible.
> 
> It does not rely on xlocale.h so we drop that patch (it was merged).
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  .../0001-parse-util-Don-t-use-xlocale.h-35.patch   | 32 ----------------------
>  package/systemd-bootchart/systemd-bootchart.hash   |  2 +-
>  package/systemd-bootchart/systemd-bootchart.mk     |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/systemd-bootchart/0001-parse-util-Don-t-use-xlocale.h-35.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
