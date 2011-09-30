From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Sep 2011 21:46:14 +0200
Subject: [Buildroot] [PATCH 1/4] Add the picocom package
In-Reply-To: <a43c69b7a1a524be05e8b42d86404b6f116a6a3e.1317210509.git.maxime.ripard@free-electrons.com>
References: <cover.1317210509.git.maxime.ripard@free-electrons.com>
 <a43c69b7a1a524be05e8b42d86404b6f116a6a3e.1317210509.git.maxime.ripard@free-electrons.com>
Message-ID: <20110930214614.1d844b95@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 28 Sep 2011 13:48:31 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> +	   http://code.google.com/p/picocom/
> \ No newline at end of file

Peter would like to see a newline here.

> +define PICOCOM_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(MAKE) -C $(@D)

Nitpicking: it probably can be on one single line.

> +$(eval $(call GENTARGETS,package,picocom))
> \ No newline at end of file

newline needed here.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
