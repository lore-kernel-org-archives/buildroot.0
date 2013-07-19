From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 23:40:36 +0200
Subject: [Buildroot] [PATCH] dhcp: add config option for delayed-ack
	feature of dhcp server
In-Reply-To: <2ac4c1f0c7025c5012b9.1374237997@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 19 Jul 2013 14:46:37 +0200")
References: <2ac4c1f0c7025c5012b9.1374237997@BEANTN0L019720>
Message-ID: <87y592tei3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> This patch creates a config option for the ISC DHCP server to
 Thomas> allow passing --enable-delayed-ack to its configure script.

Committed, thanks.

Are you really building such a big system with Buildroot that the fsyncs
matter?

-- 
Bye, Peter Korsgaard
