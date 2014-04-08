From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2014 01:02:19 +0200
Subject: [Buildroot] [PATCH v3] tcl: bump to version 8.6.1
In-Reply-To: <1396990444-13948-1-git-send-email-andrew.ruder@elecsyscorp.com>
 (Andrew Ruder's message of "Tue, 8 Apr 2014 15:54:04 -0500")
References: <1396990444-13948-1-git-send-email-andrew.ruder@elecsyscorp.com>
Message-ID: <87mwfv8lxg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

 > Turn off building compatibility layers for old/broken versions of
 > standard functions (strstr, strtoul, strtod) with the assumption that
 > anything buildroot is using as a standard C library will be good enough
 > to not have broken behavior.

 > Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > ---

 > Ok, Peter, round 3.  I promise I'm trying to get better at this :)

;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
