From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 23:50:07 +0100
Subject: [Buildroot] [PATCH 7/8] util-linux: add host variant for
	host-lttng-babeltrace
In-Reply-To: <b2a0f7f41aaba9aa1691286d04bb51fe3b6a35f6.1328038759.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 31 Jan 2012 20:40:05 +0100")
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <b2a0f7f41aaba9aa1691286d04bb51fe3b6a35f6.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zkd3h4gw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> lttng-babeltrace needs libuuid, which is provided by util-linux, and
 Thomas> since we want to build lttng-babeltrace for the host, we need to build
 Thomas> libuuid for the host. It's a shame that libuuid is part of such a big
 Thomas> package as util-linux.

Committed, thanks.

-- 
Bye, Peter Korsgaard
