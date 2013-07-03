From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 09:00:50 +0200
Subject: [Buildroot] [PATCH 05/23] toolchain: remove references to
	LIBFLOAT_TARGET
In-Reply-To: <1372620553-11416-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:28:55 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwq4qg9p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The libfloat package was removed in
 Thomas> accbd71154b8815678baa12f21f853ed8478f400, and therefore since
 Thomas> this commit, the LIBFLOAT_TARGET variable is always empty. We
 Thomas> get rid of the stale references to this variable.

Committed, thanks.

-- 
Bye, Peter Korsgaard
