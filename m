From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 13:22:07 +1100
Subject: [Buildroot] [PATCH 1/3] python-toml: new package
In-Reply-To: <20170116154620.27358-1-yegorslists@googlemail.com>
References: <20170116154620.27358-1-yegorslists@googlemail.com>
Message-ID: <20170120132207.480c748d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Jan 2017 16:46:18 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Use GitHub instead of PyPI because PyPI release if out-of-date.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                    |  1 +
>  package/python-toml/Config.in        |  6 ++++++
>  package/python-toml/python-toml.hash |  2 ++
>  package/python-toml/python-toml.mk   | 13 +++++++++++++
>  4 files changed, 22 insertions(+)
>  create mode 100644 package/python-toml/Config.in
>  create mode 100644 package/python-toml/python-toml.hash
>  create mode 100644 package/python-toml/python-toml.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
