From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 May 2012 18:47:04 +0200
Subject: [Buildroot] [PATCH 1/2] vala: do not append a -dirty suffix to
	the valac version number
In-Reply-To: <1337357705-3827-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 18 May 2012 17:15:05 +0100")
References: <1337357705-3827-1-git-send-email-spdawson@gmail.com>
Message-ID: <87396xo2rb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> When vala is built inside a Git repository with uncommitted changes, the
 spdawson> valac version number has -dirty appended. This creates problems for
 spdawson> packages (e.g. Midori) which require a valac version number without
 spdawson> the -dirty suffix.

Committed, thanks.

-- 
Bye, Peter Korsgaard
