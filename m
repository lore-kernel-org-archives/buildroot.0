From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Feb 2013 22:27:35 +0100
Subject: [Buildroot] [PATCH] boost: Pass staging dir to --with-icu
	option.
In-Reply-To: <20130207134835.GA23603@zenon.in.qult.net> (Ignacy Gawedzki's
 message of "Thu, 7 Feb 2013 14:48:35 +0100")
References: <20130207134835.GA23603@zenon.in.qult.net>
Message-ID: <87r4kqfqd4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ignacy" == Ignacy Gawedzki <i@lri.fr> writes:

 Ignacy> When using the --with-icu option without specifying the
 Ignacy> directory, boost's bootstrap.sh script will look at "common"
 Ignacy> locations (lines 289-294):

 Ignacy>     COMMON_ICU_PATHS="/usr /usr/local /sw"
 Ignacy>     for p in $COMMON_ICU_PATHS; do
 Ignacy>       if test -r $p/include/unicode/utypes.h; then
 Ignacy>         ICU_ROOT=$p
 Ignacy>       fi
 Ignacy>     done

 Ignacy> With buildroot it may surely become problematic at some point.
 Ignacy> ---

Can you please provide your signed-off-by so I can apply this? Thanks.

-- 
Bye, Peter Korsgaard
