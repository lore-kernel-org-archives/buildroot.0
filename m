From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Aug 2013 22:40:51 +0200
Subject: [Buildroot] [PATCH] openssh: fix tab/spacing in init script
In-Reply-To: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Tue, 20 Aug 2013 21:11:00 -0400")
References: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <871u5ekgto.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Several of the lines in S50sshd script have a strange mix of spaces
 Danomi> and tabs, that at least do not look consistent with neighboring lines.
 Danomi> This patch makes the spacing consistent, and also strips the trailing
 Danomi> spaces.

 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
