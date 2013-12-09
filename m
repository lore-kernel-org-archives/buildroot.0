From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Dec 2013 18:54:39 +0100
Subject: [Buildroot] [PATCH v2 1/1] ktap: new package
In-Reply-To: <1386593829-21285-1-git-send-email-anders@chargestorm.se>
References: <1386593829-21285-1-git-send-email-anders@chargestorm.se>
Message-ID: <20131209185439.051a3950@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Darander,

On Mon, 9 Dec 2013 13:57:09 +0100, Anders Darander wrote:

> +define KTAP_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPT) ktap

Are you sure this works? The variable name is TARGET_CONFIGURE_OPTS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
