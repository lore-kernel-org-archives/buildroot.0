From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Jun 2014 15:28:09 +0200
Subject: [Buildroot] [PATCH] network-manager: needs kernel headers v3.7
In-Reply-To: <1b7e8e772cec11466a7edf7844111326e2f29014.1403589519.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 24 Jun 2014 08:58:39 +0300")
References: <1b7e8e772cec11466a7edf7844111326e2f29014.1403589519.git.baruch@tkos.co.il>
Message-ID: <87y4wmxwra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > NetworkManager uses struct ifla_vxlan_port_range that was introduced in kernel
 > version 3.7.

 > Fixes:
 > http://autobuild.buildroot.net/results/6f2/6f214e3206ad0b12c633a7632c1e32c369e447ff/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
