From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 16:19:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/sngrep: add libgcrypt missing
 dependencies
In-Reply-To: <20170520162751.30809-1-romain.naour@gmail.com>
References: <20170520162751.30809-1-romain.naour@gmail.com>
Message-ID: <20170523161950.2b24f43f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 May 2017 18:27:50 +0200, Romain Naour wrote:
> Even if libgcrypt is selected at Kconfig level, it's missing from
> Makefile level.
> 
> Fixes:
> http://autobuild.buildroot.net/results/36c/36c28e7e49b31ed2398a67db2e9b08e3aad5a3ee

Could you explain how this build failure apparently related to ncurses
has something to do with the gnutls/libgcrypt issue ?

The patch itself looks good, but the relation with this particular
build failure isn't really clear. Could you clarify?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
