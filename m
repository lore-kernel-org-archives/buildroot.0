From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:12:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: new package
In-Reply-To: <1544141284-28960-1-git-send-email-james.hilliard1@gmail.com>
References: <1544141284-28960-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181209171231.567c653b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Dec 2018 08:08:04 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Read write lock for asyncio.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/python-aiorwlock/Config.in             |  7 +++++++
>  package/python-aiorwlock/python-aiorwlock.hash |  5 +++++
>  package/python-aiorwlock/python-aiorwlock.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-aiorwlock/Config.in
>  create mode 100644 package/python-aiorwlock/python-aiorwlock.hash
>  create mode 100644 package/python-aiorwlock/python-aiorwlock.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
