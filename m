From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 23:16:09 +0200
Subject: [Buildroot] [PATCH 0 of 2 v5-resend2] Add find utility
	functions / exclude files from strip
In-Reply-To: <patchbomb.1340343288@beantl019720> (Thomas De Schampheleire's
 message of "Fri, 22 Jun 2012 07:34:48 +0200")
References: <patchbomb.1340343288@beantl019720>
Message-ID: <87d34pbug6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> This patch series adds a few utility functions to pkg-utils.mk that
 Thomas> help in composing find commands, and uses these functions to exclude
 Thomas> user-configured files and directories from being stripped in target-finalize.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
