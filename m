From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 14:03:14 +0100
Subject: [Buildroot] [PATCHv2] quota: select
	BR2_PACKAGE_UTIL_LINUX_BINARIES
In-Reply-To: <1364127607-29027-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 24 Mar 2013 09:20:07 -0300")
References: <1364127607-29027-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738vlkl0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> All of the util-linux tools options depend on
 Gustavo> BR2_PACKAGE_UTIL_LINUX_BINARIES that select all the required util-linux
 Gustavo> libraries and enable the tools build process.
 Gustavo> So basically quota is selecting a hidden/unavailable option and
 Gustavo> triggering a util-linux build failure. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/bc3c75e7c60fe6db54ea56dd7c398ba7878bff83/

Committed, thanks.

-- 
Bye, Peter Korsgaard
