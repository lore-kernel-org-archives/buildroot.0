From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2014 19:32:13 +0100
Subject: [Buildroot] [PATCH] bash: switch to release tarball
In-Reply-To: <1415376509-22702-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Nov 2014 13:08:29 -0300")
References: <1415376509-22702-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mw82vp3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Yay!
 > The release tarball allows us to drop sizable in-tree patches, so switch
 > to it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/bash/bash-000-mkbuiltins-cross.patch |   31 -
 >  package/bash/bash-001-patchlevel1-27.patch   | 1072 ------------
 >  package/bash/bash-002-patchlevel28.patch     | 2270 --------------------------
 >  package/bash/bash-003-patchlevel29.patch     |   64 -
 >  package/bash/bash-004-patchlevel30.patch     | 2069 -----------------------
 >  package/bash/bash.hash                       |    2 +-
 >  package/bash/bash.mk                         |    2 +-
 >  7 files changed, 2 insertions(+), 5508 deletions(-)

That's a nice diffstat!

Committed, thanks.

-- 
Bye, Peter Korsgaard
