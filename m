From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:41:57 +0200
Subject: [Buildroot] [PATCH] ngrep: don't use pcap_restart
In-Reply-To: <5f74bf29ba9fee73b424ab03aaf6cc0bacdd3bef.1477544644.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 27 Oct 2016 08:04:04 +0300")
References: <5f74bf29ba9fee73b424ab03aaf6cc0bacdd3bef.1477544644.git.baruch@tkos.co.il>
Message-ID: <87vawei3oq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libpcap since version 1.8.1 does not export the pcap_restart symbol. Disable
 > use of this symbol.

 > Fixes:
 > http://autobuild.buildroot.net/results/647/647061a6fe8cffe3b083c911a986fa7683cdb8f6/
 > http://autobuild.buildroot.net/results/d90/d90e4d7c62e5b860f1f0ffb5e4dc545928f91734/
 > http://autobuild.buildroot.net/results/560/56076caede5c7bfc8a57da3a9dc47d0d22309e79/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
