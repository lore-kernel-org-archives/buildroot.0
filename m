From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 19:56:00 +0200
Subject: [Buildroot] [PATCH 1/3] toolchain-external: update Arm ARM
 toolchain 8.3-2019.03
In-Reply-To: <20190605115532.5015-1-romain.naour@gmail.com>
References: <20190605115532.5015-1-romain.naour@gmail.com>
Message-ID: <20190618195600.365db925@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Wed,  5 Jun 2019 13:55:30 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Update to gcc 8.1 and gcc 8.2.

It updates to gcc 8.1 and gcc 8.2 at the same time ? Seems weird!

In fact, it updates to gcc 8.3, gdb 8.2 and binutils 2.32. I fixed that
up in all three patches, and applied them to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
