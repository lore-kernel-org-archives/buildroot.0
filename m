From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:26:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/pigpio: add soversion to shared
 libraries
In-Reply-To: <20190926193917.1239-1-grzegorz@blach.pl>
References: <20190926193917.1239-1-grzegorz@blach.pl>
Message-ID: <20190927222623.7c40ad3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Sep 2019 19:39:17 +0000
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Install shared libraries as *.so.1 and symlink them to *.so.
> This change fixes pigpiod crash during startup.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/pigpio/pigpio.mk | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

I've improved a bit the commit log, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
