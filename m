From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 09:38:59 +0100
Subject: [Buildroot] [PATCH] erlang: bump to version R16B03
In-Reply-To: <1386823184-607-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Wed, 11 Dec 2013 23:39:44 -0500")
References: <1386823184-607-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87ppoywlss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > ---
 >  package/erlang/erlang.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
 > index 4a94af0..32d18e4 100644
 > --- a/package/erlang/erlang.mk
 > +++ b/package/erlang/erlang.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -ERLANG_VERSION = R16B01
 > +ERLANG_VERSION = R16B03

I was just about to commit this, but erlang.org is apparently down :/
I'll wait until it is back online to not break the autobuilders / people
using git.

-- 
Bye, Peter Korsgaard
