From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 10:28:52 +0100
Subject: [Buildroot] [PATCH 1/7] toolchain-external: CodeSourcery ARM:
 support only one version
In-Reply-To: <5675DBF6.2090308@mind.be>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
 <5675DBF6.2090308@mind.be>
Message-ID: <20151220102852.3ed0a2b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, 19 Dec 2015 23:36:38 +0100, Arnout Vandecappelle wrote:

>  One remark here (which applies to the whole series): it lacks legacy handling.
> I would propose to let all of the removed symbols select
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM.

We never did legacy handling when bumping the toolchain versions:

$ grep CODESOURCERY Config.in.legacy 
$

So I don't think it is useful when moving away from versioned-symbols
to non-versioned ones.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
