From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Jan 2013 19:00:23 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: add option to install
 utilities
In-Reply-To: <1357398022-29518-1-git-send-email-yann.morin.1998@free.fr>
References: <1357398022-29518-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130105190023.5ed0c97d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  5 Jan 2013 16:00:22 +0100, Yann E. MORIN wrote:

> +ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
> +# Utilitiess are selected, build and install everything

Utilities

> +DVB_APPS_INSTALL_STAGING = YES

Why ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
