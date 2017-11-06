From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 23:32:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-05
In-Reply-To: <20171106070008.EF932203A4@mail.free-electrons.com>
References: <20171106070008.EF932203A4@mail.free-electrons.com>
Message-ID: <20171106233211.4d44f84b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Nov 2017 08:00:08 +0100 (CET), Thomas Petazzoni wrote:

>     mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/556b5b82e3307944c261edfe9e2a9246a605d8d5 |     
>       mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/2f3b30620799193572fc24eca07d34f6c33a2482 |     
>         bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/a7f70de99f1f088ee0b003cdb912bdfb87f03f5a |     

I worked on a fix for this one, which I have submitted upstream:
https://github.com/open-power/pdbg/pull/23/commits/854c2b513af2d28c552e28f43a80dc7c55eabe27.
Since the fix is far from trivial, I'll wait for upstream feedback
before submitting to Buildroot.

Alternatively, we could restrict this package to a smaller set of
architectures, as it's very unlikely (impossible?) to see this package
used on mips or bfin.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
