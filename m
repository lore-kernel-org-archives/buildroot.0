From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 20 Jan 2021 05:02:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 5.10.0
In-Reply-To: <20210119230354.094e2cdc@windsurf.home>
References: <20210119213118.23579-1-petr.vorel@gmail.com>
 <20210119230354.094e2cdc@windsurf.home>
Message-ID: <20210120040227.GA50583@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> On Tue, 19 Jan 2021 22:31:18 +0100
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > Understand that rebuilding all toolchains takes lots of time.

> It doesn't really take that much time. I just kicked-off a rebuild of
> the toolchains with Buildroot 2020.11, and I'll try to follow-up on
> that.
Great, thanks a lot! I hope you mean 2020.11.x branch, which contains also fix
for MUSL toolchain ("uapi: move constants from <linux/kernel.h> to <linux/const.h>").

Kind regards,
Petr

> Thomas
