From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 07:26:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add optional systemd
 dependency
In-Reply-To: <20200330002649.36004-1-james.hilliard1@gmail.com>
References: <20200330002649.36004-1-james.hilliard1@gmail.com>
Message-ID: <20200330072649.2c03052d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Mar 2020 18:26:49 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> core/notifier.c:27:10: fatal error: systemd/sd-daemon.h: No such file or directory
>    27 | #include <systemd/sd-daemon.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~

Under what situations/configurations to you have this build failure.
Because I don't immediately see how adding an optional dependency can
fix such a build failure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
