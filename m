From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:30:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-async-lru: new package
In-Reply-To: <20191211022411.66872-1-james.hilliard1@gmail.com>
References: <20191211022411.66872-1-james.hilliard1@gmail.com>
Message-ID: <20191214223002.699e8efa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 19:24:11 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Simple lru_cache for asyncio.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-async-lru/Config.in             |  7 +++++++
>  package/python-async-lru/python-async-lru.hash |  5 +++++
>  package/python-async-lru/python-async-lru.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-async-lru/Config.in
>  create mode 100644 package/python-async-lru/python-async-lru.hash
>  create mode 100644 package/python-async-lru/python-async-lru.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
