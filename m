From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jan 2013 00:22:41 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	xorg-improvements
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:12 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pq1f9s5a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a series of improvements to the X.org support. Initially, my
 Thomas> intention was to:

 Thomas>  * Patches 1 to 7 are fixes around the X.org modular vs. Kdrive
 Thomas>    selection (moving at the right place, renaming options), add
 Thomas>    support to build some Kdrive input drivers (evdev, mouse, kbd),
 Thomas>    etc.

Committed the first 6 (with the Config.in indentation fix as noticed by
Arnout). I'll try to find time to review and commit the rest tomorrow.


-- 
Bye, Peter Korsgaard
