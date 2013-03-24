From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:57:09 +0100
Subject: [Buildroot] [PATCH 20/22] dependencies: test all programs
	before bailing out
In-Reply-To: <1364113606-20836-21-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:44 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-21-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvzlklay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The current dependencies code abort as soon as one program is
 Thomas> missing. It is quite annoying when multiple programs are
 Thomas> missing. Instead, bail out if needed after testing all programs.

Committed, thanks.

-- 
Bye, Peter Korsgaard
