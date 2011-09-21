From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 15:31:33 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <4E79E001.7010409@lucaceresoli.net>
References: <4E79E001.7010409@lucaceresoli.net>
Message-ID: <20110921153133.2d816865@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Sep 2011 15:00:49 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> All of these examples are about tools that could generally be
> downloaded, built and installed by each developer on their own
> machine. Nevertheless any developer may benefit from having them
> built inside buildroot: it would be more handy and quick to build
> them, and also guarantee that the version used in buildroot is
> somehow tested by other buildroot users.
> 
> Moreover, some packages (such as omap-u-boot-utils for which I posted
> a patch) have their own right of being inside buildroot because they
> also contribute to building the BR images. Having a user option to
> build them, even if they are not required for image generation, would
> require little effort.
> 
> So the big question is: do we want some host packages to be enabled
> vie a user option?
> 
> Where do we want these user options?
> How about a newly created "Host tools" menu at top level?
> 
> Does anybody have additional examples in favor or against?

And also:

If we decide to show /some/ host tools (but not all) in menuconfig, what
is the boundary between host tools visible in menuconfig and those not
visible in menuconfig ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
