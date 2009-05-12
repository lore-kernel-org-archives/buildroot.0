From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 May 2009 12:25:15 +0200
Subject: [Buildroot] [PATCH] .gitignore: Ease /binaries pattern
In-Reply-To: <1242037567-6496-1-git-send-email-mroth@nessie.de> (Michael
	Roth's message of "Mon\, 11 May 2009 12\:26\:07 +0200")
References: <1242037567-6496-1-git-send-email-mroth@nessie.de>
Message-ID: <877i0m7h4k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Roth <mroth@nessie.de> writes:

 Michael> The current /binaries/* hid the directory, but completely removed
 Michael> it by "git-clean -d", which should not be intended.

Applied, thanks.

-- 
Bye, Peter Korsgaard
