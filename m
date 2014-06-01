From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 22:16:14 +0200
Subject: [Buildroot] [PATCH v4 02/11] pkg-cmake.mk: do not hardcode
	absolute path in toolchainfile.cmake
In-Reply-To: <1401614673-3703-3-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 1 Jun 2014 11:24:24 +0200")
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-3-git-send-email-s.martin49@gmail.com>
Message-ID: <87zjhw2xo1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > The patch allows sharing or moving the toolchains.
 > This is a step toward making the toolchain/sdk relocatable.

 > Closes #6818

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Cc: Uwe Strempel <u.strempel@googlemail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > changes v3 -> v4:
 > - rebase
 > - add comments to explain the logic (Arnout)

Committed with the comment reworded as suggested by Thomas, thanks.

-- 
Bye, Peter Korsgaard
