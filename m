From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Sep 2013 13:02:05 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-stats: update set of files to skip
In-Reply-To: <1378890739-3788-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Wed, 11 Sep 2013 11:12:18 +0200")
References: <1378890739-3788-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87hadrsjte.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 Jerzy> In BR sub-directory boot/ linux/ and package/ there are a few .mk files which
 Jerzy> aren't <package>.mk files. These files shouldn't be taken into account
 Jerzy> in package statistics.

Committed, thanks.

-- 
Bye, Peter Korsgaard
