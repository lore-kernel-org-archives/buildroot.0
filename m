From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:48:11 +0200
Subject: [Buildroot] [PATCH] python-bcrypt: new package
In-Reply-To: <20170612143002.31178-1-yegorslists@googlemail.com>
References: <20170612143002.31178-1-yegorslists@googlemail.com>
Message-ID: <20170612234811.5ebb9467@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 16:30:02 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-bcrypt/Config.in          |  8 ++++++++
>  package/python-bcrypt/python-bcrypt.hash |  3 +++
>  package/python-bcrypt/python-bcrypt.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-bcrypt/Config.in
>  create mode 100644 package/python-bcrypt/python-bcrypt.hash
>  create mode 100644 package/python-bcrypt/python-bcrypt.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
