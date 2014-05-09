From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 May 2014 15:05:58 +0200
Subject: [Buildroot] [PATCH] samba4: update to upstream patches
In-Reply-To: <1399638697-28670-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 9 May 2014 09:31:37 -0300")
References: <1399638697-28670-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx8z9k5l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Update the package to use patches that have been applied upstream and
 > update their status comment accordingly.

 > f_fsid checks have been fixed via upstream patch that allows the cache
 > to work properly on the result.

 > Builtin heimdal tools can be worked around via the --bundled-libraries
 > option to disable those components (even if they are not libraries it
 > can be done that way).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
