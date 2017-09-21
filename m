From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 15:41:49 +0200
Subject: [Buildroot] [PATCH 1/1] download/git: force gzip compression
	level 6
In-Reply-To: <1505168020-23634-1-git-send-email-brain@jikos.cz> (Petr
 Kulhavy's message of "Tue, 12 Sep 2017 00:13:40 +0200")
References: <1505168020-23634-1-git-send-email-brain@jikos.cz>
Message-ID: <87r2v0uq1u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Kulhavy <brain@jikos.cz> writes:

 > Force gzip compression level 6 when calculating hash of a downloaded GIT repo.
 > To make sure the tar->gzip->checksum chain always provides consistent result.`

 > The script was relying on the default compression level, which must not be
 > necessarily consistent among different gzip versions. The level 6 is gzip's
 > current default compression level.

 > Signed-off-by: Petr Kulhavy <brain@jikos.cz>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
