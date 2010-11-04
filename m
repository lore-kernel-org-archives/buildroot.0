From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 00:06:19 +0100
Subject: [Buildroot] [pull request] ethtool, gpsd, libnl, portmap, pptp,
	readline, rp-pppoe, netsnmp
In-Reply-To: <4CC76A7A.4060404@zacarias.com.ar> (Gustavo Zacarias's message of
	"Tue, 26 Oct 2010 20:55:38 -0300")
References: <4CC76A7A.4060404@zacarias.com.ar>
Message-ID: <87aalo7kpg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> ethtool: bump to version 2.6.35
 Gustavo> gpsd: new package
 Gustavo> libnl: fix minor memleak, properly install library (.so wasn't +x so
 Gustavo> strip didn't strip - now smaller)
 Gustavo> portmap: bump to version 6.0, convert to autotargets
 Gustavo> pptp: bump to version 1.7.2, convert to gentargets
 Gustavo> readline: bump to version 6.1
 Gustavo> rp-pppoe: convert to autotargets, bump to 3.10 and undeprecate
 Gustavo> netsnmp: bump to version 5.6, make it a bit smaller

Thanks, pulled and pushed.

-- 
Bye, Peter Korsgaard
