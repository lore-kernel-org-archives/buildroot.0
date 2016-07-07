From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 22:12:22 +0200
Subject: [Buildroot] [PATCH] python-dialog3: new package
In-Reply-To: <1467901911-5054-1-git-send-email-yegorslists@googlemail.com>
References: <1467901911-5054-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160707221222.366a4a85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 16:31:51 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Existing python-dialog package supports Python 2 only. For Python 3
> another package is required.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-dialog3/Config.in           | 10 ++++++++++
>  package/python-dialog3/python-dialog3.hash |  3 +++
>  package/python-dialog3/python-dialog3.mk   | 15 +++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-dialog3/Config.in
>  create mode 100644 package/python-dialog3/python-dialog3.hash
>  create mode 100644 package/python-dialog3/python-dialog3.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
