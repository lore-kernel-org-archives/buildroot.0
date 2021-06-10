From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:12:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.48
In-Reply-To: <20210602151034.84953-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 2 Jun 2021 17:10:34 +0200")
References: <20210602151034.84953-1-bernd.kuhls@t-online.de>
Message-ID: <87tum5iimd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.48
 > Fixes CVE-2021-31618:
 > mod_http2: Fix a potential NULL pointer dereference [Ivan Zhakov]

 > Removed patch 0004 which is included in upstream release.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
