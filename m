From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 May 2012 19:34:29 -0300
Subject: [Buildroot] [PATCH] ramspeed: new package
In-Reply-To: <20120529230223.4e833059@skate>
References: <1338324518-5281-1-git-send-email-gustavo@zacarias.com.ar>
 <20120529230223.4e833059@skate>
Message-ID: <9fd3cd22786bee23a0f24046f8861301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-29 18:02, Thomas Petazzoni wrote:

> Nitpicking: those two commands do not necessarily need to belong to 
> the
> shell same command. I.e, you can write it as:
>
> +define RAMSPEED_BUILD_CMDS
> +	cp -f package/ramspeed/Makefile $(@D)
> +	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +		make -C $(@D) $(RAMSPEED_ARCH)
> +endef
>
> Thomas

Force of habit!
Sent a V2 with a few additional minor adjustments too.
Regards.
