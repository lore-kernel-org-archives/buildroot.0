From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 May 2019 00:05:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: fix build with new
 headers
In-Reply-To: <20190224204931.2759-1-panfilov.artyom@gmail.com>
References: <20190224204931.2759-1-panfilov.artyom@gmail.com>
Message-ID: <fda3acb4-bc2e-7b2c-46f3-eeea5ece2f60@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/02/2019 21:49, Artem Panfilov wrote:
> net_tstamp.h in recent kernel versions requires time.h for clockid_t.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/93903e8abfeaa7df0b6525033fa63e29f2c9e7ae
> Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>

 There should be an empty line above your Sob. I fixed that up and applied to
master, thanks.

 There was some discussion if this was the proper approach, but the patch comes
from upstream, and it's still failing in the autobuilders.

 Regards,
 Arnout
