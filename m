From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:36:39 +0200
Subject: [Buildroot] [PATCH 1/1] download/git: force gzip compression
	level 6
In-Reply-To: <1505168020-23634-1-git-send-email-brain@jikos.cz> (Petr
 Kulhavy's message of "Tue, 12 Sep 2017 00:13:40 +0200")
References: <1505168020-23634-1-git-send-email-brain@jikos.cz>
Message-ID: <87shfr4n14.fsf@dell.be.48ers.dk>
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

Committed, thanks.

Is this just a theoretical issue, or something you have really run into?

-- 
Bye, Peter Korsgaard
