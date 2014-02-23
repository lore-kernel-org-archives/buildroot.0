From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 19:35:52 +0100
Subject: [Buildroot] [PATCH] webkit: disable on powerpc
In-Reply-To: <CAAXf6LUbC4UZefJSpN_bvwXedQbOyfYC4==g9K-4V5=y=KihUg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sun, 23 Feb 2014 19:01:53
 +0100")
References: <b82a6eacae7968135320.1393165932@argentina>
 <87ppmdq1wr.fsf@dell.be.48ers.dk>
 <CAAXf6LUbC4UZefJSpN_bvwXedQbOyfYC4==g9K-4V5=y=KihUg@mail.gmail.com>
Message-ID: <87vbw5oewn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 >> What about the webkit copies in qt4/5? Do they work on powerpc?

 > Following defconfig builds just fine:

 > BR2_powerpc=y
 > BR2_DL_DIR="/home/tdescham/repo/contrib/dl"
 > BR2_BACKUP_SITE="http://sources.buildroot.net/"
 > BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 > BR2_CCACHE=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_PACKAGE_QT=y
 > # BR2_PACKAGE_QT_XML is not set
 > BR2_PACKAGE_QT_WEBKIT=y

Ok, thanks for checking.

-- 
Bye, Peter Korsgaard
