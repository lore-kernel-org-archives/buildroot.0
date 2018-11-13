From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 08:26:29 +0100
Subject: [Buildroot] [PATCH] libcurl: Don't need
 --without-(ssl/gnutls/nss/mbedtls) twice
In-Reply-To: <20181113002334.12473-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Tue, 13 Nov 2018 00:24:02 +0000")
References: <20181113002334.12473-1-tpiepho@impinj.com>
Message-ID: <87o9at4evu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > Remove the --without-* options from the yes side of the TLS libraries
 > selection checks.

 > Since the --without-* option is now specified when the corresponding TLS
 > library is not being used, it's no longer necessary when enabling a TLS
 > library to explicity list all the other TLS libs that curl should not
 > use.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
