From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 16:41:15 +0100
Subject: [Buildroot] [git commit] package/netsnmp: silence warning when
 running without IPv6
In-Reply-To: <20201017214557.E97F683676@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 17 Oct 2020 23:57:14 +0200")
References: <20201017214557.E97F683676@busybox.osuosl.org>
Message-ID: <87r1phghus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ae85c9fd719bd773d8eb55a3cd0772ed6a3ce50d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > snmpd loudly complains every 3 seconds about a failure reading
 > /proc/net/if_inet6 if the system does not have IPv6 support:

 > Jan  1 00:00:12 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory
 > Jan  1 00:00:15 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory
 > Jan  1 00:00:18 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory
 > Jan  1 00:00:21 buildroot daemon.err snmpd[92]: ipaddress_linux: could not open /proc/net/if_inet6: No such file or directory

 > Add an upstream patch to only print this warning once, rather than on every
 > poll iteration.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
