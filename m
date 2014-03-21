From: Marcin Bis <marcin@bis.org.pl>
Date: Fri, 21 Mar 2014 10:48:07 +0100
Subject: [Buildroot] [PATCH v3] bluez5_utils: new package.
In-Reply-To: <532B4158.6070602@trzebnica.net>
References: <20140304213845.GG11474@free.fr>
 <1395323298-15098-1-git-send-email-marcin@bis.org.pl>
 <532B4158.6070602@trzebnica.net>
Message-ID: <CAOPBCFWFGkYntAzb21HMag2w0LHZ62Bxx4QXjVPPyEpHWdMKcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Thank you for comments.
I am resending patch in a moment with following fixes:

> Documentation says:
> "...keep hook definition and assignment together in one if block",
> so it should rather look like:
>
> ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL),y)
> define BLUEZ5_UTILS_INSTALL_GATTTOOL
>
>         $(INSTALL) -D -m 0755 $(@D)/attrib/gatttool $(TARGET_DIR)/usr/bin
> endef
>
> BLUEZ5_UTILS_POST_INSTALL_TARGET_HOOKS += BLUEZ5_UTILS_INSTALL_GATTTOOL
> endif
Done

> Thanks a lot, but the patch should be in a separate e-mail. As you sent
> it, all your discussion answering Yann's comment would end up in the
> patch commit log.
It will be.

> Also your Signed-off-by line is missing.
Added

--
 Marcin Bis
