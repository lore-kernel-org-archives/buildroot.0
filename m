From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2014 22:43:04 +0100
Subject: [Buildroot] [PATCH 1/1] qt: ensure that target dir exists
	before installing there
In-Reply-To: <1395709517-1886-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Mon, 24 Mar 2014 21:05:17 -0400")
References: <1395709517-1886-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <878urwk55j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > All of qt.mk's target installs ensure that their destinations exist,
 > except for /usr/lib.  So do the same for /usr/lib, for consistency,
 > and in case some combination of custom fs skeleton plus dependency
 > on Qt leads to installing without a pre-existing /usr/lib directory.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
