From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 12:07:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/libressl: bump version to 2.7.2
In-Reply-To: <20180402083708.21199-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 2 Apr 2018 10:37:07 +0200")
References: <20180402083708.21199-1-bernd.kuhls@t-online.de>
Message-ID: <87tvstor9g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed patch 0001, a different version was applied upstream, please
 > see upstream PR 82 for details. Added license hash.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

According to the release notes:

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.2-relnotes.txt

* Added support for many OpenSSL 1.0.2 and 1.1 APIs, based on
  observations of real-world usage in applications. These are
  implemented in parallel with existing OpenSSL 1.0.1 APIs - visibility
  changes have not been made to existing structs, allowing code written
  for older OpenSSL APIs to continue working.

So a number of packages earlier not compatible with libressl may now
work.

-- 
Bye, Peter Korsgaard
