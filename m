From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 15:56:27 +0200
Subject: [Buildroot] [PATCH 1/1] trivial: tcl: fix TCL_SITE variable
In-Reply-To: <1380103962-19647-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Wed, 25 Sep 2013 12:12:42 +0200")
References: <1380103962-19647-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87vc1n7kl0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 Jerzy> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

That isn't really a good commit message as it doesn't fix anything
(_SITE still ends up as the same text string). Instead it should say
that it is just a cleanup with no functional change.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
