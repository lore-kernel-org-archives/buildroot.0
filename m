From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 20:22:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 1.0.2m
In-Reply-To: <20171103183359.7598-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 3 Nov 2017 19:33:59 +0100")
References: <20171103183359.7598-1-bernd.kuhls@t-online.de>
Message-ID: <87mv38j14j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes the following CVEs:
 > bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
 > Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)

 > Release notes: https://www.openssl.org/news/secadv/20171102.txt

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x and 2017.08.x after s/libopenssl/openssl/, thanks.

-- 
Bye, Peter Korsgaard
