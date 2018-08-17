From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 09:04:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 1.0.2p
In-Reply-To: <20180817053207.15702-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 17 Aug 2018 07:32:07 +0200")
References: <20180817053207.15702-1-bernd.kuhls@t-online.de>
Message-ID: <87a7plcw36.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2018-0732 & CVE-2018-0737:
 > https://www.openssl.org/news/vulnerabilities.html

 > Added upstream sha1 hash.

I'm not sure that really buys us much, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
