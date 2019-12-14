From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:30:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-janus: new package
In-Reply-To: <20191211023050.79110-1-james.hilliard1@gmail.com>
References: <20191211023050.79110-1-james.hilliard1@gmail.com>
Message-ID: <20191214223007.3064df5e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 19:30:50 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Mixed sync-async queue to interoperate between asyncio
> tasks and classic threads.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/python-janus/Config.in         |  8 ++++++++
>  package/python-janus/python-janus.hash |  5 +++++
>  package/python-janus/python-janus.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-janus/Config.in
>  create mode 100644 package/python-janus/python-janus.hash
>  create mode 100644 package/python-janus/python-janus.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
