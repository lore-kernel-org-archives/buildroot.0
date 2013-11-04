From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Nov 2013 23:49:12 +0100
Subject: [Buildroot] [PATCH 1/1] omniorb: fix autobuilder failure
In-Reply-To: <1382362757-24499-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Mon, 21 Oct 2013 08:39:17 -0500")
References: <1382362757-24499-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87zjpjok9j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 > http://autobuild.buildroot.net/results/e3244abc550a95eb69e63b8db203f39b27f3288e/
 > Turns out omniorb isn't building because of an old cross compile patch.
 > The last patchset was missing the delete.

 > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
