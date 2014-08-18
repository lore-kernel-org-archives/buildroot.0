From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Aug 2014 09:46:28 +0200
Subject: [Buildroot] [PATCH 1/1] odhcploc: new package
In-Reply-To: <53F115C2.4060907@je-eigen-domein.nl>
References: <1407607617-18039-1-git-send-email-bos@je-eigen-domein.nl>
 <20140817213415.5ea4809a@free-electrons.com>
 <53F115C2.4060907@je-eigen-domein.nl>
Message-ID: <20140818094628.12ec1927@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Sun, 17 Aug 2014 22:51:14 +0200, Floris Bos wrote:

> > +define ODHCPLOC_BUILD_CMDS
> > +     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> > Used tab for indentation instead of spaces, and replaced CC=.. LD=.. by
> > $(TARGET_CONFIGURE_OPTS).
> 
> Fine with me.
> Had copied the CC=.. LD=.. construct from the manual though ( 
> http://www.buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems 
> )
> Perhaps mention $(TARGET_CONFIGURE_OPTS) there as well?

Ah, yes, indeed. Care to send a patch ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
