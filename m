From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:34:11 +0200
Subject: [Buildroot] [PATCH RESEND 0/2] Use bzip2 for X11 PFC font
 compression
In-Reply-To: <20200713213225.7e9d3343@windsurf.home>
References: <20200713184751.23534-1-asierra@xes-inc.com>
 <20200713213225.7e9d3343@windsurf.home>
Message-ID: <20200713213411.272d1f41@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 21:32:25 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> So this third argument is a bit "moot", especially since
> host-xapp-mkfontscale already has a dependency on host-gzip, which

Sorry, host-xapp-mkfontscale has a dependency on host-zlib, but adding
a dependency on host-gzip should not cause any problem.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
