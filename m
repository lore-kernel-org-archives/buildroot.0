From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 23:10:59 +0200
Subject: [Buildroot] [PATCH v2 01/24] qt: add an option to install the
	test module
In-Reply-To: <1398208556-4195-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Wed, 23 Apr 2014 01:15:33 +0200")
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-2-git-send-email-s.martin49@gmail.com>
Message-ID: <87lhuilg9o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > When building Qt in a minimal configuration, a couple of Qt modules
 > (QtNetwork, QtSql, QtTest and QtXml) are built in addition to QtCore,
 > so they are installed in the sysroot but they are not copied into the
 > target tree.

 > Among these modules that could be built but optionally installed, only
 > QtTest had no option to allow being installed in the target fs.

 > Thus, programs linking against QtTest would successfully build, but
 > would miserably fail at runtime due to this missing dependency.

 > So far, the only package triggering this issue is OpenCV (the highgui
 > module built with Qt support).

 > A followup patch will add this missing dependency in OpenCV using this
 > new option.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
