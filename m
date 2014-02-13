From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Feb 2014 23:16:17 +0100
Subject: [Buildroot] [PATCH 1/2] nut: disable hal
In-Reply-To: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Thu, 13 Feb 2014 22:17:54 +0100")
References: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87mwhuodzi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 >  package/nut/nut.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/nut/nut.mk b/package/nut/nut.mk
 > index 04b2b41..47367e1 100644
 > --- a/package/nut/nut.mk
 > +++ b/package/nut/nut.mk
 > @@ -85,4 +85,6 @@ else
 >  NUT_CONF_OPT += --without-ssl
 >  endif
 
 > +NUT_CONF_OPT += --without-hal 

Committed with the line moved to the top of the file as suggested by
Yann, thanks.

-- 
Bye, Peter Korsgaard
