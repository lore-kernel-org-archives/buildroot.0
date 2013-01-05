From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Jan 2013 13:46:20 +0100
Subject: [Buildroot] [PATCH 20/20] support/scripts: add xorg-release.py
	script
In-Reply-To: <41c1bc2b4f8953280e305deada0b52e432974b58.1357125961.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 2 Jan 2013 12:26:55 +0100")
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <41c1bc2b4f8953280e305deada0b52e432974b58.1357125961.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcbbiyqr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This script generates a report on the packaging status of X.org
 Thomas> releases in Buildroot. It does so by downloading the list of tarballs
 Thomas> that are part of a given X.org release, and compare that with the
 Thomas> packages that are available in Buildroot.

I've dropped the .py suffix to match the other scripts and made it
executable and committed, thanks.

-- 
Bye, Peter Korsgaard
