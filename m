From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:04:24 +0100
Subject: [Buildroot] [PATCH v1] package/irqbalance: fix
 irqbalance/irqbalance-ui socket communication
In-Reply-To: <20210220231224.16680-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 21 Feb 2021 00:12:24 +0100")
References: <20210220231224.16680-1-ps.report@gmx.net>
Message-ID: <87im6ds7yv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add patch to fix irqbalance/irqbalance-ui socket communication by
 > fixing uint64_t printf format usage.

 > Fixes:

 >   $ irqbalance-ui
 >   Invalid data sent.  Unexpected token: (null)TYPE

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
