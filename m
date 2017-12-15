From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Dec 2017 09:41:31 +0000
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
In-Reply-To: <20171109215821.16615-1-abrodkin@synopsys.com>
References: <20171109215821.16615-1-abrodkin@synopsys.com>
Message-ID: <1513330890.29404.17.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2017-11-10 at 00:58 +0300, Alexey Brodkin wrote:
> Given ARC port is just a very few patches away from upstream
> and if those are based on 2.29 everything works like a charm
> let's forget about SNPS GitHub stuff and use vanilla glibc
> plus patches.
> 
> This among other things solves a problem with stable fixes for glibc.
> Now when Buildroot switched to the tip of glibc's stable branch instead of
> applying cherry-picked patches ARC version would stay behind every time
> glibc's "version" gets updated in Buildroot.
> 
> But if we just apply ARC patches then we're good with whatever commit
> from upstream stable branch is taken.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Any comments on this one?

Otherwise any chance to get it applied (not sure though if it
gets applied now and then builds)?

-Alexey
