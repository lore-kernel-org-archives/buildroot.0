From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 10:05:22 +0100
Subject: [Buildroot] [PATCH v6 2/3] libmbim: add new package
In-Reply-To: <1386150904-16813-2-git-send-email-yegorslists@googlemail.com>
References: <1386150904-16813-1-git-send-email-yegorslists@googlemail.com>
 <1386150904-16813-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <20131206100522.0660b713@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Wed,  4 Dec 2013 10:55:03 +0100, yegorslists at googlemail.com wrote:

> +LIBMBIM_VERSION = 1.4.0
> +LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim/
> +LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
> +LIBMBIM_LICENSE = GPLv2

This should be:

LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)

Hopefully Peter can change this will committing, so you don't have to
resubmit a new version.

Other than that:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
