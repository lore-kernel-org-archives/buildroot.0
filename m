From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Feb 2013 10:56:23 +0100
Subject: [Buildroot] [PATCH] boost: Pass staging dir to --with-icu
	option.
In-Reply-To: <20130208223624.GA18771@zenon.in.qult.net> (Ignacy Gawedzki's
 message of "Fri, 8 Feb 2013 23:36:24 +0100")
References: <20130207134835.GA23603@zenon.in.qult.net>
 <87r4kqfqd4.fsf@dell.be.48ers.dk>
 <20130208223624.GA18771@zenon.in.qult.net>
Message-ID: <87ehgpg69k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ignacy" == Ignacy Gawedzki <i@lri.fr> writes:

 Ignacy> On Fri, Feb 08, 2013 at 10:27:35PM +0100, thus spake Peter Korsgaard:
 >> >>>>> "Ignacy" == Ignacy Gawedzki <i@lri.fr> writes:
 >> 
 Ignacy> When using the --with-icu option without specifying the
 Ignacy> directory, boost's bootstrap.sh script will look at "common"
 Ignacy> loscript will look at "common"
 Ignacy> locations (lines 289-294):
 >> 
 Ignacy> COMMON_ICU_PATHS="/usr /usr/local /sw"
 Ignacy> for p in $COMMON_ICU_PATHS; do
 Ignacy> if test -r $p/include/unicode/utypes.h; then
 Ignacy> ICU_ROOT=$p
 Ignacy> fi
 Ignacy> done
 >> 
 Ignacy> With buildroot it may surely become problematic at some point.
 Ignacy> ---
 >> 
 >> Can you please provide your signed-off-by so I can apply t

 Ignacy> Do you mean this simple line:

 Ignacy>   Signed-off-by: Ignacy Gaw?dzki <i@lri.fr>

Yes, committed - Thanks.

-- 
Bye, Peter Korsgaard
