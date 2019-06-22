From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 10:18:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/qemu: Move patches to version
 directory
In-Reply-To: <20190604095605.7c9e7ef1@thl530.multi.box>
References: <1559564887-4088-1-git-send-email-guoren@kernel.org>
 <20190604095605.7c9e7ef1@thl530.multi.box>
Message-ID: <20190622101821.4ef025b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 4 Jun 2019 09:56:05 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> At least the usbfs patch seems to be included in QEMU v4.0, so maybe it
> would be better to bump the version to 4.0 first?

Bumping to 4.0 would certainly be nice, but it really is a different
thing than what Guo is doing. Since it's not really necessary to add
support for C-SKY's Qemu version, I don't want to make bumping to 4.0 a
requirement for Guo's work.

> Thomas, did you ever send the first patch to upstream QEMU, too? Looks
> like a valid patch to me, so I think it should be accepted there,
> too...?

To be honest, I don't remember if I ever sent it upstream :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
