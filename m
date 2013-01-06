From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 22:07:50 +0100
Subject: [Buildroot] [PATCH] libdvdnav: requires thread support in
	toolchain
In-Reply-To: <1355956450-7421-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 19 Dec 2012 23:34:10 +0100")
References: <1355956450-7421-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738yef2ah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libdvdnav requires thread support. The only package that depends on
 Thomas> libdvdnav is mplayer, and it is an optional dependency, only activated
 Thomas> when libdvdnav is enabled. So we don't have to push this thread
 Thomas> support dependency to any other package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
