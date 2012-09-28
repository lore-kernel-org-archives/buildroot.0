From: Valentine Barshak <gvaxon@gmail.com>
Date: Fri, 28 Sep 2012 23:17:30 +0400
Subject: [Buildroot] [PATCH 0/2] Slightly amend mplayer options
Message-ID: <20120928191730.GA9550@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are a couple of mplayer nitpicks.

Valentine Barshak (2):
  mplayer: Amend libmad selection
  mplayer: Only enable IPv6 if BR2_INET_IPV6 is set

 package/multimedia/mplayer/mplayer.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Thanks,
Val.
-- 
1.7.11.4
