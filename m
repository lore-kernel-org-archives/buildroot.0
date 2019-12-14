From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:29:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-mako: new package
In-Reply-To: <20191211021314.54504-1-james.hilliard1@gmail.com>
References: <20191211021314.54504-1-james.hilliard1@gmail.com>
Message-ID: <20191214222958.71cc3981@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 19:13:14 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> mako template renderer for aiohttp.web (http server for
> asyncio).
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-aiohttp-mako/Config.in              | 10 ++++++++++
>  .../python-aiohttp-mako/python-aiohttp-mako.hash   |  5 +++++
>  package/python-aiohttp-mako/python-aiohttp-mako.mk | 14 ++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/python-aiohttp-mako/Config.in
>  create mode 100644 package/python-aiohttp-mako/python-aiohttp-mako.hash
>  create mode 100644 package/python-aiohttp-mako/python-aiohttp-mako.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
