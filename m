From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 19:06:39 +0100
Subject: [Buildroot] [PATCH] mpd: disable for sparcv8
In-Reply-To: <20160122174652.GM17143@waldemar-brodkorb.de>
References: <20160119224338.GA16884@waldemar-brodkorb.de>
 <20160120101807.33930860@free-electrons.com>
 <20160122174652.GM17143@waldemar-brodkorb.de>
Message-ID: <20160122190639.4a83e4db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Jan 2016 18:46:52 +0100, Waldemar Brodkorb wrote:

> May be we can add this patch now and when you figured everything out
> to do a clean solution, you just use grep to find the problematic
> packages disabled for sparc/sparc64.
> 
> Therefore we have some fewer autobuild failures meanwhile.
> Other atomic related patches got applied, so we should do this until
> your refactoring.

Agreed. Then it would be good to make sure to annotate such
dependencies in a systematic way, so that we can easily grep for them
in the future.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
