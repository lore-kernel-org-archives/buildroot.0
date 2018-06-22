From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 11:44:38 +0200
Subject: [Buildroot] [PATCH] gnutls: drop wchar dependency
In-Reply-To: <0498bce769c634b0718a5b0ce7337581d611c63e.1529645921.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 22 Jun 2018 08:38:41 +0300")
References: <0498bce769c634b0718a5b0ce7337581d611c63e.1529645921.git.baruch@tkos.co.il>
Message-ID: <87bmc3kveh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 19448f40a0 (gnutls: use included unistring unless libunistring is
 > selected) made libunistring and optional dependency. So now gnutls need
 > no longer depend on wchar.

 > Drop wchar dependency of libmicrohttpd and libsoup, which are gnutls
 > reverse dependencies that do not depend themselves on wchar.

 > Update the comments in libsoup and taskd; the wchar dependency is now
 > not due to gnutls.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
