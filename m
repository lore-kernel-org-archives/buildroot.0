From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 15:40:22 +0100
Subject: [Buildroot] [PATCH] vlc: fix some configure options
In-Reply-To: <1393360566-4849-1-git-send-email-spdawson@gmail.com> (Simon
 Dawson's message of "Tue, 25 Feb 2014 20:36:06 +0000")
References: <1393360566-4849-1-git-send-email-spdawson@gmail.com>
Message-ID: <871tyoaaax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 > Fix a large number of incorrect configure options for vlc.
 > Configure warnings reported by Arnout Vandecappelle, in his analysis of vlc
 > autobuild failures.

Committed with the commit message extended to explain that this is
caused by our autoreconfm thanks.

-- 
Bye, Peter Korsgaard
