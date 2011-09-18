From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Sep 2011 13:05:54 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package: add openocd support
In-Reply-To: <20110918102209.GE16141@game.jcrosoft.org> (Jean-Christophe
 PLAGNIOL-VILLARD's message of "Sun, 18 Sep 2011 12:22:09 +0200")
References: <1312911561-23942-2-git-send-email-plagnioj@jcrosoft.com>
 <1316289171-21296-1-git-send-email-plagnioj@jcrosoft.com>
 <8739fuw60t.fsf@macbook.be.48ers.dk>
 <20110918102209.GE16141@game.jcrosoft.org>
Message-ID: <87y5xmun3h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 >> This is with a trivial defconfig:
 >> 
 >> BR2_arm=y
 >> BR2_arm926t=y
 >> BR2_PACKAGE_OPENOCD=y
 >> 
 >> E.G. to reproduce stick those 3 lines in .config and run

 Jean-Christophe> which version of gcc do you use?

Like the config says, the default version (4.3.6).

-- 
Bye, Peter Korsgaard
