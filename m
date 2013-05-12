From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 22:11:21 +0200
Subject: [Buildroot] [PATCH] pulseaudio: fix build with orc
In-Reply-To: <1368389122-23651-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 12 May 2013 22:05:22 +0200")
References: <1368389122-23651-1-git-send-email-arnout@mind.be>
Message-ID: <87ehdcvtzq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> The configure script gets orcc from pkg-config, which sets it
 Arnout> to /usr/bin/orcc instead of $(HOST_DIR)/usr/bin/orcc. So set
 Arnout> the path explicitly instead of relying on pkg-config.

 Arnout> While we're at it, also add an explicit enable/disable to
 Arnout> configure.

Committed, thanks.

-- 
Bye, Peter Korsgaard
