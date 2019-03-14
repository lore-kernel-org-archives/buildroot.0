From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 23:33:13 +0100
Subject: [Buildroot] [PATCH 1/1] python-aiohttp-cors: new package
In-Reply-To: <20190224033522.3115-1-james.hilliard1@gmail.com>
References: <20190224033522.3115-1-james.hilliard1@gmail.com>
Message-ID: <20190314233313.0a7b0ba2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Feb 2019 11:35:22 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> CORS support for aiohttp.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-aiohttp-cors/Config.in              |  8 ++++++++
>  .../python-aiohttp-cors/python-aiohttp-cors.hash   |  5 +++++
>  package/python-aiohttp-cors/python-aiohttp-cors.mk | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-aiohttp-cors/Config.in
>  create mode 100644 package/python-aiohttp-cors/python-aiohttp-cors.hash
>  create mode 100644 package/python-aiohttp-cors/python-aiohttp-cors.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
