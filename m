From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 21:10:38 +0200
Subject: [Buildroot] [PATCH] openssl: fix host-openssl dependencies
In-Reply-To: <1368384975-20193-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 12 May 2013 20:56:15 +0200")
References: <1368384975-20193-1-git-send-email-arnout@mind.be>
Message-ID: <87y5bkxbdd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> Support for ocf-linux or cryptodev-linux added a dependency of
 Arnout> host-openssl on host-ocf-linux / host-cryptodev-linux, which we
 Arnout> don't have and the dependency is anyway not needed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
