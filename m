From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 13:23:16 +0800
Subject: [Buildroot] [PATCH v2] added python unicode selection to menu
In-Reply-To: <1389043062-29826-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1389043062-29826-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20140107132316.1b79f953@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 6 Jan 2014 15:17:42 -0600, Matt Weber wrote:

> +# Default is UCS2 w/o a conf opt
> +ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
> +HOST_PYTHON_CONF_OPT += --enable-unicode=ucs4
> +PYTHON_CONF_OPT      += --enable-unicode=ucs4
> +endif

Why is the selection of UCS4 for the target tied to the usage of UCS4
on the host?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
