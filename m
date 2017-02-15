From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 11:04:44 +0100
Subject: [Buildroot] [PATCH v3] kmscube: Add new package
In-Reply-To: <1487152829-13115-1-git-send-email-festevam@gmail.com>
References: <1487152829-13115-1-git-send-email-festevam@gmail.com>
Message-ID: <20170215110444.270c833b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 08:00:28 -0200, Fabio Estevam wrote:

> +KMSCUBE_VERSION = 8c6a20901f95e1b465bbca127f9d47fcfb8762e6
> +KMSCUBE_SITE = $(call github,robclark,kmscube,$(KMSCUBE_VERSION))
> +KMSCUBE_LICENSE = MIT
> +KMSCUBE_DEPENDENCIES = host-pkgconf

You no longer depend on mesa3d here? This looks weird. It really builds
if you start from scratch and do "make kmscube" ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
