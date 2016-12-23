From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:39:04 +0100
Subject: [Buildroot] [PATCH 05/14] collectd: explicitly disable xencpu
	plugin
In-Reply-To: <20161222015921.6832-5-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Wed, 21 Dec 2016 22:59:12 -0300")
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
 <20161222015921.6832-5-gustavo@zacarias.com.ar>
Message-ID: <87shpee35z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It requires the libxenctrl library which buildroot doesn't provide yet.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
