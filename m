From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 18:53:05 +0200
Subject: [Buildroot] [PATCH 2/5] busybox: Install scripts only when
 needed
In-Reply-To: <1413643624-14757-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141018185305.312f75b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 16:47:01 +0200, Maxime Hadjinlian wrote:

> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)

	, y

should be

	,y

i.e, with no space.

> +ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)

Ditto.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
