From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 22:33:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/bzip2: security bump version to
 1.0.8
In-Reply-To: <20190803195526.24827-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 3 Aug 2019 21:55:26 +0200")
References: <20190803195526.24827-1-bernd.kuhls@t-online.de>
Message-ID: <878ssa7zwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Switched to new maintainer source:
 > https://sourceware.org/ml/bzip2-devel/2019-q2/msg00022.html

 > Version 1.0.7 fixes CVE-2016-3189 & CVE-2019-12900.

But we already have a fix for CVE-2019-12900 in
0003-Make-sure-nSelectors-is-not-out-of-range.patch. How come you are
not removing it?

-- 
Bye, Peter Korsgaard
