From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 12:44:25 +0200
Subject: [Buildroot] [PATCH v5 08/13] support/test-pkg: get configs from
 buildroot defconfigs
In-Reply-To: <fe449879-0ba1-6b3c-bc94-0f5ae9670f2c@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
 <20170406181854.5242-8-arnout@mind.be>
 <20170406213735.003749a9@free-electrons.com>
 <20170406204804.GC3538@scaer>
 <20170406225034.342c907e@free-electrons.com>
 <fe449879-0ba1-6b3c-bc94-0f5ae9670f2c@mind.be>
Message-ID: <20170407124425.27d9d45e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Apr 2017 12:35:09 +0200, Arnout Vandecappelle wrote:

>  I'm working on updating autobuild-run. Unfortunately it's a bit difficult to
> test changes in that script, e.g. removing the condition on BR2_STATIC_LIBS. I
> basically have to wait until the script hits a glibc toolchain to see if it
> works correctly. Can you think of any way to speed that up?

For this sort of situation, I was editing the CSV file to keep only the
one toolchain I'm interested in. Or alternatively, hacking the function
that chooses the toolchain to always pick up the one I'm interested in.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
