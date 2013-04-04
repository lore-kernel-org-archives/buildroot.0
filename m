From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Apr 2013 22:57:49 +0200
Subject: [Buildroot] [PATCH] foomatic-filters: make location of enscript
	very clear
In-Reply-To: <1365072901-11719-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 4 Apr 2013 07:55:01 -0300")
References: <1365072901-11719-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nfm3tf6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Passing --with-file-converter=enscript isn't enough since the
 Gustavo> build system will try the fallback options (a2ps, mpage,
 Gustavo> texttops) if it's not found.  This has two bad effects: one of
 Gustavo> the tools leaking from the distribution making
 Gustavo> foomatic-filters think everything will be the same on the
 Gustavo> target (and failing when that's not the case), and failed
 Gustavo> builds when none is found (enscript is installed in the target
 Gustavo> directory, the build system doesn't look there).  So just
 Gustavo> avoid the test by stating explicitly where enscript will live
 Gustavo> in the target. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/37ad3d2c5c35f00c644a2c572f1429bafa4b7cf4/

Committed, thanks.

-- 
Bye, Peter Korsgaard
