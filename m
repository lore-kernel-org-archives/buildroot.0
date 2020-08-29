From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:56:02 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/spandsp: bump version to
 3.0.0
In-Reply-To: <20200829204005.2815997-1-bernd.kuhls@t-online.de>
References: <20200829204005.2815997-1-bernd.kuhls@t-online.de>
Message-ID: <20200829225602.14aa4647@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:40:03 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Reformatted hashes.
> 
> Switched upstream to freeswitch repo which is maintained by the author
> of spandsp:
> https://github.com/signalwire/freeswitch/issues/681#issuecomment-671498542
> 
> The previous project URL http://www.soft-switch.org/ is not reachable
> anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied to next, but I have two comments/questions.

> +SPANDSP_VERSION = 3.0.0-6ec23e5a7e

This version naming scheme is weird. Why not just 3.0.0 ? What is even
more weird is that https://files.freeswitch.org/downloads/libs/ shows
two 3.0.0 versions:

  spandsp-3.0.0-6ec23e5a7e.tar.gz
  spandsp-3.0.0-f995f452ee.tar.gz

Another thing: could you update on release-monitoring.org the
definition of this project at
https://release-monitoring.org/project/12600/ to properly track this
new upstream location ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
