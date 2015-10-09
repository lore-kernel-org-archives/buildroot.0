From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:27:25 +0200
Subject: [Buildroot] [PATCH v2] picocom: bump to version 2.0
In-Reply-To: <1444297640-3094-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444297640-3094-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151009152725.24e846e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 8 Oct 2015 10:47:20 +0100, Vicente Olivert Riera wrote:

>  define PICOCOM_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)

MAKE_ENV should have been TARGET_MAKE_ENV.

Committed with this issue fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
