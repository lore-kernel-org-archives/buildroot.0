From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 23:31:13 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/qemu: add spice support
In-Reply-To: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
References: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
Message-ID: <20200713233113.559b47f5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Jun 2020 15:50:00 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> update to add qemu spice support
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/qemu/Config.in | 9 +++++++++
>  package/qemu/qemu.mk   | 8 +++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)

As discussed, I've dropped the sub-option, and simply made it an
implicit optional dependency. And applied, of course!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
