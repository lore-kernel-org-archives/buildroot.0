From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 23:21:11 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: add tmon
In-Reply-To: <ef5184a4-ab70-4772-7950-b1a573e29ea4@mind.be>
References: <1500415831-17747-1-git-send-email-mmayer@broadcom.com>
 <20170719213905.34cc4c8b@windsurf>
 <CAGt4E5s3Yp7zu4vgSCWCZEaRo0W5r5yNSwTrLcM3u07nSteAKQ@mail.gmail.com>
 <ef5184a4-ab70-4772-7950-b1a573e29ea4@mind.be>
Message-ID: <20170719232111.4a3dd01c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 23:12:53 +0200, Arnout Vandecappelle wrote:

>  That's why we have utils/test-pkg. For things with a kernel dependency it's a
> bit more complicated to set up (you need a different kernel config for different
> toolchains, and BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG is not available for
> all arches and takes a loooooong time for x86_64). But with e.g. just one for
> ARM you already get pretty far.

Yeah, I really wouldn't put the blame on a contributor for not having
used test-pkg on a package like linux-tools that is really not simple to
test with test-pkg.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
