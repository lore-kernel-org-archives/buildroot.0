From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Oct 2012 21:56:06 +0200
Subject: [Buildroot] [PATCH v2] openvpn: Fix paths to external utilities
In-Reply-To: <20120930204358.GA23699@gmail.com> (Valentine Barshak's message
 of "Mon, 1 Oct 2012 00:43:58 +0400")
References: <20120930204358.GA23699@gmail.com>
Message-ID: <87zk3w3fhl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Valentine" == Valentine Barshak <gvaxon@gmail.com> writes:

 Valentine> This sets paths to ifconfig, route, netstat and ip
 Valentine> in the target root filesystem.

 Valentine> Otherwise the paths leak from the host and may not
 Valentine> match those on the target.

Committed, thanks.

-- 
Bye, Peter Korsgaard
