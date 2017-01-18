From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jan 2017 11:31:40 +0100
Subject: [Buildroot] [PATCH] Revert "gperf: bump to version 3.1"
In-Reply-To: <20170117232312.3629-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 17 Jan 2017 20:23:12 -0300")
References: <20170117232312.3629-1-gustavo@zacarias.com.ar>
Message-ID: <87mveou0ab.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Revert gperf bump, it's breaking everything left and right. Fixes:
 > http://autobuild.buildroot.net/results/9d5/9d5dad172fe5c5a6247cd5ce6928307236184a64/
 > http://autobuild.buildroot.net/results/872/8728860024c7d114fb5b8df3f55588ac09ecf323/

 > And probably other packages as well.

 > This reverts commit 570c8d2ae6a10e10b45adc75145726994219f946.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied (for now).

-- 
Bye, Peter Korsgaard
