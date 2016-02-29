From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:08:27 +0100
Subject: [Buildroot] [PATCH] sox: disable SSP when using MIPS Codescape
	toolchains
In-Reply-To: <56D47948.9020505@imgtec.com>
References: <1456763982-36511-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160229175158.3c01895a@free-electrons.com>
 <56D47948.9020505@imgtec.com>
Message-ID: <20160229210827.18465518@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Feb 2016 17:00:56 +0000, Vicente Olivert Riera wrote:

> Uhm..., how would you do that? BR2_TOOLCHAIN_HAS_SSP is selected by
> BR2_TOOLCHAIN_USES_GLIBC. We would need to do changes in the toolchain
> infra in order to not define it in that place, and define it
> individually for every toolchain. Is that what you mean?

Yes, this is what I mean. It is indeed more work, but looks cleaner IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
