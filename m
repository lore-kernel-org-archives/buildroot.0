From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Sep 2014 23:13:20 +0200
Subject: [Buildroot] [PATCH] BR2_DEPRECATED: update option label and help
In-Reply-To: <1411134069-3327-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 19 Sep 2014 10:41:09 -0300")
References: <1411134069-3327-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k34z48lr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > We should use positive logic (show things that are otherwise hidden...)
 > for the help since it's what it does.
 > It also applies to more options than just packages alone, for example
 > the AVR32 architecture so add an "options" label to it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  Config.in | 5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/Config.in b/Config.in
 > index 14ff55b..b494fab 100644
 > --- a/Config.in
 > +++ b/Config.in
 > @@ -301,9 +301,10 @@ config BR2_CCACHE_INITIAL_SETUP
 >  endif
 
 >  config BR2_DEPRECATED
 > -	bool "Show packages that are deprecated or obsolete"
 > +	bool "Show options and packages that are deprecated or obsolete"
 >  	help
 > -	  This option hides outdated/obsolete versions of packages.
 > +	  This option shows outdated/obsolete versions of packages and
 > +	  options that are hidden otherwise.

Committed with Yann's feedback, thanks.

-- 
Bye, Peter Korsgaard
