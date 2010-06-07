From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 23:05:41 +0200
Subject: [Buildroot] [PATCH] target skeleton definition
In-Reply-To: <4c0d5b02.8c4bdf0a.5e33.ffff9c4e@mx.google.com>
References: <4c0d5b02.8c4bdf0a.5e33.ffff9c4e@mx.google.com>
Message-ID: <20100607230541.5f2bf769@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dmytro,

On Mon, 7 Jun 2010 21:06:42 +0300
Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:

> Here's the patch to give posibility to redefine path to the rootfs
> skeleton. Also this patch moves default and busybox skeleton trees
> into fs/skeleton dir.

Thanks for this patch. In general, this is something I intended to do,
so it's great to see patches implementing this.

Personaly, I'd prefer if we could get rid of the "busybox" skeleton
altogether. I think Peter Korsgaard agreed with this decision, but I'll
let him restate his preference here.

If Peter agrees, then the skeleton could be moved to just fs/skeleton/.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
