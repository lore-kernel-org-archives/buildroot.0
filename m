From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Nov 2018 12:00:44 +0100
Subject: [Buildroot] [PATCH] gcc: Don't mess with test-suite exclusion
In-Reply-To: <20181030083124.2766-1-abrodkin@synopsys.com>
References: <20181030083124.2766-1-abrodkin@synopsys.com>
Message-ID: <cdd891b6-f6b5-6963-8292-9a24916f276b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/10/18 09:31, Alexey Brodkin wrote:
> We used to exclude GCC's test-suite for quite some time now
> mostly for the sake of build time reduction.

 Actually, it was excluded to save space, not build time. But in the end, it
also saves at best 20% of the overall spaces. So I've updated the commit message
to reflect that and applied to master, thanks.

 Romain, I believe you introduced this feature. If you do think there's a good
reason to keep it, please send a revert.

 Regards,
 Arnout
