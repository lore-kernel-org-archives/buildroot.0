From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Apr 2013 23:54:45 +0200
Subject: [Buildroot] [PATCH] monit: add license information
In-Reply-To: <1366011607-31433-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 15 Apr 2013 08:40:07 +0100")
References: <1366011607-31433-1-git-send-email-spdawson@gmail.com>
Message-ID: <87eheblas9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/monit/monit.mk |    2 ++
 spdawson>  1 file changed, 2 insertions(+)

 spdawson> diff --git a/package/monit/monit.mk b/package/monit/monit.mk
 spdawson> index a8b6447..0d24e05 100644
 spdawson> --- a/package/monit/monit.mk
 spdawson> +++ b/package/monit/monit.mk
 spdawson> @@ -6,6 +6,8 @@
 
 spdawson>  MONIT_VERSION = 5.4
 spdawson>  MONIT_SITE = http://mmonit.com/monit/dist/
 spdawson> +MONIT_LICENSE = AGPLv3+

Hmm, I see very few files mentioning the 'any later version':

grep -rls 'any later version' *
aclocal.m4
config/config.sub
config/ltmain.sh
config/missing
config/config.guess
configure
COPYING
libmonit/config/config.sub
libmonit/config/ltmain.sh
libmonit/config/missing
libmonit/config/config.guess
libmonit/m4/libtool.m4
libmonit/configure
libmonit/aclocal.m4
libmonit/COPYING
libmonit/libtool
src/tokens.h
src/protocols/sip.c
src/protocols/lmtp.c
src/y.tab.c

E.G. basically no source files.

src/monit.c also talks about a special openssl exception.

How should we handle this?

-- 
Bye, Peter Korsgaard
