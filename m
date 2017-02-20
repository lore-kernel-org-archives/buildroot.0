From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 09:53:47 +0100
Subject: [Buildroot] [PATCH] packages: improve license type lists
In-Reply-To: <1487396332-20370-1-git-send-email-danomimanchego123@gmail.com>
References: <1487396332-20370-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20170220095347.5f9ac11c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 00:38:52 -0500, Danomi Manchego wrote:
>  LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
> -LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
> +LIBURCU_LICENSE = LGPLv2.1+ (library), MIT-like (few source files listed in LICENSE); GPLv2+ (test); GPLv3 (few *.m4 files)

The ";" separators here should have been turned into commas.

With this fixed:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
