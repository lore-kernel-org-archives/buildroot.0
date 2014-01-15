From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 14:23:25 +0100
Subject: [Buildroot] [PATCH] mpd: add more gcc exclusions
In-Reply-To: <1389791024-15833-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 15 Jan 2014 10:03:44 -0300")
References: <1389791024-15833-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87iotlv0oi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The codesourcery powerpc toolchains also include a gcc that's too old
 > for mpd to build properly. Fixes:
 > http://autobuild.buildroot.net/results/be0/be0aff9814ded4ba74999283530b805af01992da/

 > Also add toolchain comment exclusion for avr32 & sparc since it won't be
 > available anyway.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
