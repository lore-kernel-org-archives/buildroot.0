From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2008 14:07:00 +0100
Subject: [Buildroot] TARGET_CONFIGURE_OPTS
In-Reply-To: <ce76e3890811122014sbad333ai2101488d14ddb7f5@mail.gmail.com>
References: <ce76e3890811122014sbad333ai2101488d14ddb7f5@mail.gmail.com>
Message-ID: <20081113140700.67b6db3b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 13 Nov 2008 14:44:10 +1030,
"malcolm blaney" <mblaney@gmail.com> a ?crit :

> I'm trying to build dropbear, and have found that having
> $(TARGET_CONFIGURE_OPTS) in the command to build:
> $(DROPBEAR_DIR)/$(DROPBEAR_BINARY) in the file:
> package/dropbear/dropbear.mk breaks my build. With it present the
> value of CFLAGS in dropbear's makefile is not used and so some include
> paths go missing. It seems to build fine when removed, or when placed
> before $(MAKE) on the line.

What are the error messages ? What version of Buildroot are you using ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
