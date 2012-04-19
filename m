From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Apr 2012 16:03:06 +0200
Subject: [Buildroot] [PATCH 03/22] Remove filename extension crap for OS
	compatibility
In-Reply-To: <5cae11523664c212bbb8278fce0d36d79a0a0acc.1334673910.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 16:45:15 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <5cae11523664c212bbb8278fce0d36d79a0a0acc.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ehrjn7j9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The only variable that is used is HOST_LOADLIBES, defined for the
 Thomas> cygwin case in the kconfig build. Since we don't support cygwin,
 Thomas> simply get rid of this.

Committed, thanks.

-- 
Bye, Peter Korsgaard
