From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Apr 2011 20:55:30 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/more-qt-fixes
In-Reply-To: <cover.1301843856.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 3 Apr 2011 17:18:59 +0200")
References: <cover.1301843856.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87hbafyxjx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Changes since the previous version:

 Thomas>  * Pass MAKEFLAGS down to Qt ./configure script, in addition to the
 Thomas>    -j$(BR2_JLEVEL) flag.

 Thomas>  * Test if the usr/lib/qt/plugins exists in STAGING_DIR before copying
 Thomas>    its contents to the TARGET_DIR. It is a bit pedantic as the current
 Thomas>    version of Qt, with just QtCore and no other libraries or plugins
 Thomas>    installs one plugin, but it may not be the case in future versions
 Thomas>    of Qt.

Committed, thanks!

-- 
Bye, Peter Korsgaard
