From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:33:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: disable for nds32
In-Reply-To: <20190617024445.4077-1-nylon7@andestech.com>
References: <20190617024445.4077-1-nylon7@andestech.com>
Message-ID: <20190617203336.185f7187@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Jun 2019 10:44:45 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> There is no support for nds32 in gdb.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/1a40b1ac5f06c856c2e30dbbb4e485022c438c72
> 
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  package/gdb/Config.in      | 1 +
>  package/gdb/Config.in.host | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
