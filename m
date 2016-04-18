From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 13:35:10 +0200
Subject: [Buildroot] [PATCH v2] cannelloni: make SCTP support optional
In-Reply-To: <1460974018-29267-1-git-send-email-yegorslists@googlemail.com>
References: <1460974018-29267-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160418133510.278e6638@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 12:06:58 +0200, yegorslists at googlemail.com wrote:

> +ifeq ($(BR2_PACKAGE_LKSCTP_TOOLS),y)
> +CANNELLONI_CONF_OPTS += -DSCTP_SUPPORT=ON
>  CANNELLONI_DEPENDENCIES = lksctp-tools

Now that this dependency is conditional, I've changed this = to += to
avoid possible mistakes in the future.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
