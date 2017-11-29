From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:07:30 +0100
Subject: [Buildroot] [PATCH v8] libostree: new package
In-Reply-To: <20171112210609.12275-1-marcus.folkesson@gmail.com>
References: <20171112210609.12275-1-marcus.folkesson@gmail.com>
Message-ID: <20171129230730.0255fd38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Nov 2017 22:06:09 +0100, Marcus Folkesson wrote:
> OSTree is an upgrade system for Linux-based operating systems
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

I've applied your patch to next, with a small fix to the license
information (see below).

I'm not very familiar with OSTree. Is a target version of it
sufficient? How do you prepare updates to be deployed?

> +LIBOSTREE_VERSION = 2017.12
> +LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
> +LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
> +
> +LIBOSTREE_LICENSE = GPLv2

We now use SPDX license codes everywhere, so GPL-2.0. In addition, the
license really is GPL-2.0+ (because all files have the "or later"
option).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
