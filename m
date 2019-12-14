From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:29:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-sockjs: new package
In-Reply-To: <20191211015143.28688-1-james.hilliard1@gmail.com>
References: <20191211015143.28688-1-james.hilliard1@gmail.com>
Message-ID: <20191214222949.05b7d10c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 18:51:43 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> SockJS server implementation for aiohttp.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-sockjs/Config.in          |  8 ++++++++
>  package/python-sockjs/python-sockjs.hash |  5 +++++
>  package/python-sockjs/python-sockjs.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-sockjs/Config.in
>  create mode 100644 package/python-sockjs/python-sockjs.hash
>  create mode 100644 package/python-sockjs/python-sockjs.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
