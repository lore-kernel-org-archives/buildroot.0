From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:12:13 +0200
Subject: [Buildroot] [PATCH] toolchain: disable PIE for static build
	with musl
In-Reply-To: <e5ceac77a5ace9cfb989319cb33261d32885bd04.1495490829.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 23 May 2017 01:07:09 +0300")
References: <e5ceac77a5ace9cfb989319cb33261d32885bd04.1495490829.git.baruch@tkos.co.il>
Message-ID: <87k24vlruq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > As mentioned in commit 3c93901bcd2 (toolchain: add hidden symbol for PIE
 > support), support for static PIE using musl requires a gcc patch[1]. Buildroot
 > doesn't carry this patch. Don't enable BR2_TOOLCHAIN_SUPPORTS_PIE in static
 > build with musl.

 > Fixes:
 > http://autobuild.buildroot.net/results/d19/d19bcfcfb33cc5f5b082b97bbd5852d479823b97/
 > http://autobuild.buildroot.net/results/91f/91f7c6954c337b03f5ac141050d9b1bee1623376/
 > http://autobuild.buildroot.net/results/996/996116da9241686110b9525eed08cc5acfd379a6/

 > [1] https://github.com/richfelker/musl-cross-make/blob/b854a42fc1ea19b8c4ec7104848f9d1a6d7995f0/patches/gcc-6.3.0/0010-static-pie-support.diff

 > Acked-by: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
