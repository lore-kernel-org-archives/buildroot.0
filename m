From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 23:01:08 +0100
Subject: [Buildroot] [PATCH 1/1] sawman: add autoreconf step
In-Reply-To: <1393104580-10965-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Sat, 22 Feb 2014 22:29:40 +0100")
References: <1393104580-10965-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87wqgmremz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > sawman needs the autoreconf step added in order for Vicente Olivert
 > Riera's patch - "sawman: Link using gcc instead of ld"
 > (8fc5ea004386431eaecfea51376fcc11c23c77c1) - to take effect.

 > Fixes:
 >   http://autobuild.buildroot.net/results/19b/19bfe0d39e457fd260b73928331721f57555fc84

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
