From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 22:39:39 +0100
Subject: [Buildroot] [PATCH 1/1] python-aiohttp: new package
In-Reply-To: <1542657158-9559-1-git-send-email-james.hilliard1@gmail.com>
References: <1542657158-9559-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181121223939.198b81e0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Nov 2018 03:52:38 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Async http client/server framework (asyncio).
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-aiohttp/Config.in           | 14 ++++++++++++++
>  package/python-aiohttp/python-aiohttp.hash |  5 +++++
>  package/python-aiohttp/python-aiohttp.mk   | 14 ++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/python-aiohttp/Config.in
>  create mode 100644 package/python-aiohttp/python-aiohttp.hash
>  create mode 100644 package/python-aiohttp/python-aiohttp.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
