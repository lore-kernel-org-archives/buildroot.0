From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Apr 2010 20:27:00 +0200
Subject: [Buildroot] [PATCH 11/25] Get rid of all usages of BR2_RECENT
In-Reply-To: <6e36dd3554c5e768809b788bdb1fec2203708c16.1270958653.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 11 Apr 2010 06:05:07 +0200")
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
	<cover.1270958653.git.thomas.petazzoni@free-electrons.com>
	<6e36dd3554c5e768809b788bdb1fec2203708c16.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pr25kfpn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---

This is a pretty big user visible change - E.G. BR2_RECENT defaults to
Y, an BR2_DEPRECATED doesn't, so quite some options are now hidden by
default.

Is this what we want to do?

-- 
Bye, Peter Korsgaard
