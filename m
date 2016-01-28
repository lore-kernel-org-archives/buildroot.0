From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2016 22:27:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssl: security bump to
	version 1.0.2f
In-Reply-To: <1454009827-8517-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Thu, 28 Jan 2016 20:37:07 +0100")
References: <1454009827-8517-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87si1ho0nc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > DH small subgroups (CVE-2016-0701)
 > SSLv2 doesn't block disabled ciphers (CVE-2015-3197)
 > An update on DHE man-in-the-middle protection (Logjam)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
