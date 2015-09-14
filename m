From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 14:36:33 +0200
Subject: [Buildroot] [PATCH v2] stress-ng: Depend on kernel headers >=
	3.3
In-Reply-To: <1442216625-12120-1-git-send-email-corjon.j@ecagroup.com> (Julien
 Corjon's message of "Mon, 14 Sep 2015 09:43:45 +0200")
References: <1441988351-9923-1-git-send-email-corjon.j@ecagroup.com>
 <1442216625-12120-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <87a8sp9nzi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Corjon <corjon.j@ecagroup.com> writes:

 > perf.c need PERF_COUNT_HW_REF_CPU_CYCLES generic PMU event which
 > is available only since 3.3 kernel version

 > Fixes:
 >   http://autobuild.buildroot.net/results/88909b118dc927f31ed5c3b5f3513734a88085a9
 >   http://autobuild.buildroot.net/results/dac6a85fdd721b959175caf5629b91dee717c3c6
 >   http://autobuild.buildroot.net/results/88909b118dc927f31ed5c3b5f3513734a88085a9

 > Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
 > ---
 > v1 -> v2 : 
 >   - Fixe commit log (suggested by Vincente Olivert Riera)
 >   - Add autobuild references (suggested by Romain Naour)

Committed, thanks.

-- 
Bye, Peter Korsgaard
