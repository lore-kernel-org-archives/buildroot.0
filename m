From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:19:02 +0100
Subject: [Buildroot] [PATCH] Add LTris package (SDL game)
In-Reply-To: <1389186456-21848-1-git-send-email-julien.boibessot@free.fr>
References: <1389186456-21848-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140128221902.3a2f4815@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Jan 2014 14:07:36 +0100, julien.boibessot at free.fr wrote:

> +ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
> +LTRIS_DEPENDENCIES += sdl_mixer
> +LTRIS_CONF_OPT += --enable-audio=yes

	--enable-audio

would have been sufficient I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
