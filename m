From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:27:49 +0200
Subject: [Buildroot] [PATCH 1/5] python-simplesqlite: new package
In-Reply-To: <20170904062126.3274-1-yegorslists@googlemail.com>
References: <20170904062126.3274-1-yegorslists@googlemail.com>
Message-ID: <20170906232749.0d0b82e1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 08:21:22 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                                    |  1 +
>  package/python-simplesqlite/Config.in                | 16 ++++++++++++++++
>  package/python-simplesqlite/python-simplesqlite.hash |  3 +++
>  package/python-simplesqlite/python-simplesqlite.mk   | 14 ++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/python-simplesqlite/Config.in
>  create mode 100644 package/python-simplesqlite/python-simplesqlite.hash
>  create mode 100644 package/python-simplesqlite/python-simplesqlite.mk

Applied to master, thanks. I've added an upstream URL at the end of the
Config.in help text.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
