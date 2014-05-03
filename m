From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 23:11:16 +0200
Subject: [Buildroot] [PATCH v2 02/24] opencv: fix qt selection when
	highgui is enable
In-Reply-To: <1398208556-4195-3-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Wed, 23 Apr 2014 01:15:34 +0200")
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-3-git-send-email-s.martin49@gmail.com>
Message-ID: <87ha56lg97.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > The OpenCV highgui module links against QtGui and QtTest.
 > The latter is built by default but was never installed.
 > Thanks to the previous patch on Qt, this can be rectified.

 > So, update the OpenCV Config.in with the missing Qt module selection.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
