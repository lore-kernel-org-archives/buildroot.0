From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Apr 2008 22:44:47 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  devmem2
In-Reply-To: <20080419145615.GA12780@cloud.net.au> (Hamish Moffatt's message
	of "Sun\, 20 Apr 2008 00\:56\:15 +1000")
References: <20080418135451.0EFAF3C30B@busybox.net>
	<20080419145615.GA12780@cloud.net.au>
Message-ID: <8763udvakg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 Hamish> On Fri, Apr 18, 2008 at 06:54:51AM -0700, jacmet at uclibc.org wrote:
 >> Log:
 >> buildroot: devmem2 package

 Hamish> Thanks, that will be useful.

 >> if BR2_BLOCKDEV_SUPPORT
 >> source "package/acpid/Config.in"
 >> +source "package/devmem2/Config.in"
 >> source "package/dbus/Config.in"

 Hamish> Your sorting seems to be broken :-)

Argh, fixed in r21777.

-- 
Bye, Peter Korsgaard
