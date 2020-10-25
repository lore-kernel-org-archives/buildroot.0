From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 09:57:32 +0100
Subject: [Buildroot] [PATCH 0/2] package/webkitgtk: build fixes for CPUs
 which need CLoop
In-Reply-To: <20201020155311.3493430-1-aperez@igalia.com>
References: <20201020155311.3493430-1-aperez@igalia.com>
Message-ID: <20201025095732.579f1dc7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Oct 2020 18:53:09 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Adrian Perez de Castro (2):
>   package/webkitgtk: fix build with ENABLE_C_LOOP=ON
>   package/webkitgtk: disable JIT for ARMv5 and ARMv6

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
