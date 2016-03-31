From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:23:23 +0200
Subject: [Buildroot] [PATCH] nload: new package
In-Reply-To: <1457442864-32020-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1457442864-32020-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160331212323.51d2f0ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Mar 2016 10:14:24 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/Config.in        |  1 +
>  package/nload/Config.in  | 16 ++++++++++++++++
>  package/nload/nload.hash |  3 +++
>  package/nload/nload.mk   | 13 +++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/nload/Config.in
>  create mode 100644 package/nload/nload.hash
>  create mode 100644 package/nload/nload.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
