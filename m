From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 May 2015 13:40:56 +0200
Subject: [Buildroot] [PATCH] package/gptfdisk: propagate ncurses reverse
	dependency
In-Reply-To: <1432668801-29112-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Tue, 26 May 2015 21:33:21 +0200")
References: <1432668801-29112-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87y4kaw8mv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > gptfdisk cgdisk select nucurses wchar support which is disabled
 > on bfin with FLAT binary format.

 > Add the ncurses's reverse dependency to gptfdisk.

 > Fixes:
 > http://autobuild.buildroot.net/results/ce3/ce35c072f0b7c3a7a1918cb865a2eecbba8a1b23/

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
