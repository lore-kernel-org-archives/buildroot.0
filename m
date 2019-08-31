From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:54:25 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/bzip2: security bump version
 to 1.0.8
In-Reply-To: <20190803204550.656-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 3 Aug 2019 22:45:50 +0200")
References: <20190803204550.656-1-bernd.kuhls@t-online.de>
Message-ID: <875zmdhiry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Switched to new maintainer source:
 > https://sourceware.org/ml/bzip2-devel/2019-q2/msg00022.html

 > Version 1.0.7 fixes CVE-2016-3189 & CVE-2019-12900

 > Version 1.0.8 fixes the fix for CVE-2019-12900 from 1.0.7:
 > https://sourceware.org/ml/bzip2-devel/2019-q3/msg00031.html

 > Rebased 0002-improve-build-system.patch.

 > Removed 0003-Make-sure-nSelectors-is-not-out-of-range.patch, applied
 > upstream:
 > https://sourceware.org/git/?p=bzip2.git;a=commitdiff;h=7ed62bfb46e87a9e878712603469440e6882b184
 > and reverted later on
 > https://sourceware.org/git/?p=bzip2.git;a=commitdiff;h=b07b105d1b66e32760095e3602261738443b9e13

 > Added upstream sha512 hash and updated license hash after upstream
 > commits:
 > https://sourceware.org/git/?p=bzip2.git;a=history;f=LICENSE;h=81a37eab7a5be1a34456f38adb74928cc9073e9b;hb=HEAD

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: removed 0003-Make-sure-nSelectors-is-not-out-of-range.patch (Peter)

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
