From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 May 2016 13:17:12 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 3.14.x and 4.{4,
	5}.x series
References: <1463664337-881-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <oms51dx2gs.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 19 May 2016 10:25:36 -0300 schrieb Gustavo Zacarias:

> Kernel headers 4.5 -> 4.5.4 broke netfilter uapi headers leading to
> build failures for cases where glibc's net/if.h was included before
> linux/if.h This is fixed since 4.5.5 via linux kernel commit 4a91cb61
> and fixes:
> http://autobuild.buildroot.net/
results/736/7362431f62ebb1b436ac41ea3ef85228c763e6f3/

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested collectd, fixes
http://autobuild.buildroot.net/results/ae1/
ae1e3a33a1c2b7433ca7a04659467e2017756b00/)
