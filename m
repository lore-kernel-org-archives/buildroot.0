From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 19:20:55 +0100
Subject: [Buildroot] [PATCH v1 2/2] WIP: qt5base: use system/buildroot
 provided harfbuzz
In-Reply-To: <20170210171223.0492d6ca@gmx.net>
References: <20170209223055.31121-1-ps.report@gmx.net>
 <20170209223055.31121-2-ps.report@gmx.net>
 <20170210171223.0492d6ca@gmx.net>
Message-ID: <20170211192055.157a05a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 17:12:23 +0100, Peter Seiderer wrote:

> Qt5 does not (yet) have the dependency on BR2_TOOLCHAIN_HAS_SYNC_4 (but seems
> to compile fine with the bundled version of harfbuzz), is this
> because (the existing) dependency on BR2_TOOLCHAIN_HAS_THREADS_NPTL is
> 'stronger' than BR2_TOOLCHAIN_HAS_SYNC_4 (or is this complete unrelated)?

These are completely unrelated. For example, SPARC has NPTL, but not
BR2_TOOLCHAIN_HAS_SYNC_4.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
