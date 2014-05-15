From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 May 2014 23:10:51 +0200
Subject: [Buildroot] [PATCH 1/2] openpowerlink: use git repository
	instead of zip archive.
In-Reply-To: <1399590313-30617-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Fri, 9 May 2014 01:05:12 +0200")
References: <1399590313-30617-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87zjiisq78.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Since commit 6c5c08b854e4490697076ae3c5a9c587d8672c63,
 > openpowerlink package is rebuilt at every make call because
 > .stamp_downloaded is missing in the build directory.

 > The culprit is OPENPOWERLINK_EXTRACT_CMDS that remove and
 > replace the build directory.

 > unzip extract a directory "openPOWERLINK-V1.08.4" and
 > Buildroot expect a directory "openpowerlink-V1.08.4"

 > It is easier to use git repository instead of zip archive and
 > avoids rename the directory openPOWERLINK to openpowerlink.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed both, thanks. The 2nd patch is strictly seen a feature patch,
but it's pretty trivial so it looks safe for 2014.05.

-- 
Bye, Peter Korsgaard
