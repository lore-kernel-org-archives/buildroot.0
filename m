From: hartleys <hartleys@visionengravers.com>
Date: Tue, 17 Jun 2008 16:15:47 -0400
Subject: [Buildroot] Problem with buildroot and external toolchain
In-Reply-To: <87k5gng9wx.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE1909182568@mi8nycmail19.Mi8.com><20080617183841.GA18089@real.realitydiluted.com><BD79186B4FD85F4B8E60E381CAEE190918260A@mi8nycmail19.Mi8.com>
	<87k5gng9wx.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19091826AF@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Could the problem I am having with ext-tool.mk not copying my external
toolchain library files be related to the version of find installed on
my system?

I'm running Debian etch which has the following find version:

$ find --version
GNU find version 4.2.28
Features enabled: D_TYPE O_NOFOLLOW(enabled) LEAF_OPTIMISATION

I see on the GNU site that the latest version is 4.4.0 and the one
buildroot pulls in is 4.2.31.

Thanks
Hartley
