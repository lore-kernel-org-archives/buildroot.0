From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:19:42 +0200
Subject: [Buildroot] [PATCH 4/6] package/python-tinyrpc: new package
In-Reply-To: <20190531171654.17906-4-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
 <20190531171654.17906-4-matthew.weber@rockwellcollins.com>
Message-ID: <20190620221942.64857583@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 May 2019 12:16:52 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> A protocol neutral RPC library that supports JSON-RPC and zmq.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/python-tinyrpc/Config.in           |  9 +++++++++
>  package/python-tinyrpc/python-tinyrpc.hash |  5 +++++
>  package/python-tinyrpc/python-tinyrpc.mk   | 14 ++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/python-tinyrpc/Config.in
>  create mode 100644 package/python-tinyrpc/python-tinyrpc.hash
>  create mode 100644 package/python-tinyrpc/python-tinyrpc.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
