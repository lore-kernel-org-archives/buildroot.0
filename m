From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jan 2014 07:40:57 +0100
Subject: [Buildroot] [PATCH v3 05/12] rtmpdump: new package
In-Reply-To: <1390165448-9130-6-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 19 Jan 2014 22:04:01 +0100")
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390165448-9130-6-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <878uu8frie.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > rtmpdump - RTMPDump Real-Time Messaging Protocol API
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Note that this package will only install librtmp in this state.
 > Hence the name shown librtmp instead of rtmpdump

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: gimli <ebsi4711@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - Change name librtmp->rtmpdump (Yann E. Morin)
 >   - Fix definitions order (Yann E. Morin)
 >   - Add uses of prefix instead of nasty sed (Yann E. Morin)
 >   - Fix dependency to openssl/gnutls/polarssl (Yann E. Morin)
 > Changes v1 -> v2:
 >   - None

Committed with some minor changes, thanks.

-- 
Bye, Peter Korsgaard
