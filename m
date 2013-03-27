From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Mar 2013 16:29:21 +0100
Subject: [Buildroot] [PATCH] jhead: new package
In-Reply-To: <1364395222-21896-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364395222-21896-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130327162921.528740b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 27 Mar 2013 11:40:22 -0300, Gustavo Zacarias wrote:
> +define JHEAD_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CFLAGS="$(TARGET_CFLAGS)" \
> +	LDFLAGS="$(TARGET_LDFLAGS)" CC="$(TARGET_CC)" -C $(@D)

	$(TARGET_CONFIGURE_OPTS) ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
