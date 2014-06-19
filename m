From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Jun 2014 17:53:25 +0200
Subject: [Buildroot] [PATCH] tcpreplay: use pcap-config
In-Reply-To: <1403173608-15736-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 19 Jun 2014 07:26:48 -0300")
References: <1403173608-15736-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2e428wa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Since other libs can be pulled in by libpcap switch to using
 > pcap-config, it's the correct way and simpler. Fixes:
 > http://autobuild.buildroot.net/results/c02/c023bacd35e9ef1addeb881cd3d572f97f9b4b56/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
