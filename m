From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jun 2010 13:39:29 +0200
Subject: [Buildroot] [PATCH] skeleton: remove loopback interface
	configuration from inittab
In-Reply-To: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
	(Baruch Siach's message of "Thu, 3 Jun 2010 08:36:50 +0300")
References: <acc7c503a6179494174d8225e121b23d69a24b61.1275543349.git.baruch@tkos.co.il>
Message-ID: <87d3w0h1u6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> The lo interface is marked auto in /etc/network/interfaces, so the
 Baruch> configuration of the loopback network interface is part of the
 Baruch> S40network init script. This causes the "RTNETLINK answers: File exists" error
 Baruch> message to appear at startup time.

Committed, thanks.

-- 
Bye, Peter Korsgaard
