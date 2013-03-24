From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:48:13 +0100
Subject: [Buildroot] [PATCH 13/22] ncurses: enable shared library build
	on the host
In-Reply-To: <1364113606-20836-14-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:37 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9ptm0aa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On the host, we generally build and install a shared library
 Thomas> rather than a static version of libraries. In this specific
 Thomas> case, we will want to build host-gettext, which builds a shared
 Thomas> library that depends on ncurses. And this doesn't work well if
 Thomas> ncurses is static because it hasn't been built with
 Thomas> -fPIC. Therefore, let's build ncurses as shared on the host.

Committed, thanks.

-- 
Bye, Peter Korsgaard
