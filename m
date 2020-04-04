From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:04:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/swupdate: add optional systemd
 dependency
In-Reply-To: <20200330002649.36004-1-james.hilliard1@gmail.com>
References: <20200330002649.36004-1-james.hilliard1@gmail.com>
Message-ID: <20200404230405.2e36a81d@windsurf.home>
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
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swupdate/swupdate.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master with an extended commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
