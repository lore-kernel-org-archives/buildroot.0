From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 13:39:31 +0200
Subject: [Buildroot] [PATCH 2 of 2] check-deprecated-variable: move call
 to respective infra where appropriate
In-Reply-To: <17b8f7627130f84d5e80.1412495912@localhost>
References: <98b4f7f5e2ea63e41fa1.1412495911@localhost>
 <17b8f7627130f84d5e80.1412495912@localhost>
Message-ID: <20141005133931.74d85bdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 05 Oct 2014 09:58:32 +0200, Thomas De Schampheleire wrote:
> Move the checks for AUTORECONF_OPT, GETTEXTIZE_OPT to pkg-autotools.mk,
> and for KCONFIG_OPT to pkg-kconfig.mk.
> 
> The other checks are used by several infras and are therefore better placed
> in pkg-generic.mk.

As per the discussion with Yann, I've rejected this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
