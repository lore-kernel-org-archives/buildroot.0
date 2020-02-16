From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 11:19:19 +0100
Subject: [Buildroot] [PATCH] mfgtools: fix build issue
In-Reply-To: <20200211150445.GA15724@p1g2.work> (Gary Bisson's message of
 "Tue, 11 Feb 2020 16:04:45 +0100")
References: <20200211150445.GA15724@p1g2.work>
Message-ID: <87k14mj0m0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <bisson.gary@gmail.com> writes:

 > The tool fails to build on recent distros due to conflicting declaration
 > of __time64_t. Adding a check around the declaration to avoid
 > redefinition.

 > Patch not submitted upstream as the tool is not supported by NXP
 > anymore[1].

 > Fixes:
 > http://autobuild.buildroot.net/results/ca4498ad21a96ba2a38ca2467dadffdbb516355b/

 > [1] https://github.com/NXPmicro/mfgtools/pull/104

 > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
 > ---
 > Hi,

 > As explained in my reply to Jorg's patch that drops mfgtools [1], I'm
 > having second thoughts on this.
 > Maybe this small patch should be included instead of dropping the
 > package?

I didn't see any feedback (But you didn't add Joern in To). I don't
really know much about the imx SW, but as this is a trivial patch I've
applied it.

-- 
Bye, Peter Korsgaard
