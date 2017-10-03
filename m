From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 22:03:53 +0200
Subject: [Buildroot] [PATCH 2/6] lua-fifo: new package
In-Reply-To: <20170924161859.10994-2-francois.perrad@gadz.org>
References: <20170924161859.10994-1-francois.perrad@gadz.org>
 <20170924161859.10994-2-francois.perrad@gadz.org>
Message-ID: <20171003220353.1f58984f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Sep 2017 18:18:55 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in              |  1 +
>  package/lua-fifo/Config.in     |  6 ++++++
>  package/lua-fifo/lua-fifo.hash |  2 ++
>  package/lua-fifo/lua-fifo.mk   | 14 ++++++++++++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/lua-fifo/Config.in
>  create mode 100644 package/lua-fifo/lua-fifo.hash
>  create mode 100644 package/lua-fifo/lua-fifo.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
