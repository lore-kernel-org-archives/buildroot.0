From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:47:40 +0200
Subject: [Buildroot] [PATCH 1/1] eigen: Fix pkg-config file prefix error
In-Reply-To: <20180816221620.30881-1-flatmax@flatmax.com> (Matt Flax's message
 of "Fri, 17 Aug 2018 08:16:20 +1000")
References: <20180816221620.30881-1-flatmax@flatmax.com>
Message-ID: <87zhxci21f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Flax <flatmax@flatmax.com> writes:

 > From: Matt Flax <flatmax@flatmax.org>
 > eigen generates	a pkg-config file which	has a broken prefix. This broken
 > prefix causes an incorrect path	when other packages call
 > pkg-config --cflags eigen

 > This patch fixes the prefix in the generated eigen pc file and prjects
 > which depend on	this pc	file can now path correctly to the eigen include
 > directory at build time.

 > Signed-off-by: Matt Flax <flatmax@flatmax.org>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
