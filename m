From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Sep 2013 21:12:20 +0200
Subject: [Buildroot] [PATCH] netatalk: bump to version 3.0.5
In-Reply-To: <1377899996-26302-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 30 Aug 2013 18:59:56 -0300")
References: <buildroot@busybox.net>
 <1377899996-26302-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u58e4q3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Make it use external instead of bundled libevent - it's better
 Gustavo> for size reasons (avoiding possible duplication) and security
 Gustavo> reasons (easier to upgrade one global library than possibly
 Gustavo> two or more, and generally upstream would probably be more
 Gustavo> responsive to those).

Committed, thanks.

-- 
Bye, Peter Korsgaard
