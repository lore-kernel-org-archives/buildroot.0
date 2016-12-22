From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Dec 2016 10:29:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: security bump version
	to 2.7.13
In-Reply-To: <20161222064600.4604-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 22 Dec 2016 07:46:00 +0100")
References: <20161222064600.4604-1-bernd.kuhls@t-online.de>
Message-ID: <87fulg1fdh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Rebased patches 004 & 010.
 > Changelog:
 > https://hg.python.org/cpython/raw-file/v2.7.13/Misc/NEWS

 > Fixes CVE-2016-2183 & CVE-2016-1000110.


 > This bump also fixes the host build with openssl 1.1.0,
 > http://patchwork.ozlabs.org/patch/696139/ is not needed anymore.

Ok, I've marked that as superseeded.

Committed, thanks.

-- 
Bye, Peter Korsgaard
