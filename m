From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 May 2013 11:59:47 +0200
Subject: [Buildroot] [PATCH v2] libxml2: depend on zlib and libiconv if
	appropriate
In-Reply-To: <1368613115-13584-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 15 May 2013 11:18:35 +0100")
References: <1368613115-13584-1-git-send-email-spdawson@gmail.com>
Message-ID: <878v3elyek.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

 spdawson> ---
 spdawson>  v2: As suggested by Peter Korsgaard, correct iconv handling
 spdawson>  to cope with the case where iconv() is provided by the
 spdawson>  toolchain, rather than by libiconv.

Committed, thanks.

-- 
Bye, Peter Korsgaard
