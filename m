From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Jun 2012 22:04:25 +0200
Subject: [Buildroot] [PATCH] monit: fix configuration error
In-Reply-To: <1339489635-11299-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 12 Jun 2012 09:27:15 +0100")
References: <1339489635-11299-1-git-send-email-spdawson@gmail.com>
Message-ID: <87vcirgh12.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Configuration fails for the monit package, with the following error.

 spdawson>   checking for SSL library directory... Not found

 spdawson>   Couldn't find your SSL library files.
 spdawson>   Use --with-ssl-lib-dir option to fix this problem or disable the
 spdawson>   SSL support with --without-ssl

 spdawson> Tweak the monit configuration command line so that openssl is found.

Committed, thanks.

-- 
Bye, Peter Korsgaard
