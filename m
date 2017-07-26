From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 22:52:58 +0200
Subject: [Buildroot] [PATCH] webkitgtk: security bump to version 2.16.6
In-Reply-To: <20170726085040.20516-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 26 Jul 2017 10:50:40 +0200")
References: <20170726085040.20516-1-peter@korsgaard.com>
Message-ID: <87379ix6mt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-7018 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7030 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7034 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7037 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7039 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7046 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7048 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7055 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7056 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7061 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > tvOS before 10.2.2 is affected.  The issue involves the "WebKit" component.
 > It allows remote attackers to execute arbitrary code or cause a denial of
 > service (memory corruption and application crash) via a crafted web site.

 > CVE-2017-7064 - An issue was discovered in certain Apple products.  iOS
 > before 10.3.3 is affected.  Safari before 10.1.2 is affected.  iCloud before
 > 6.2.2 on Windows is affected.  iTunes before 12.6.2 on Windows is affected.
 > The issue involves the "WebKit" component.  It allows attackers to bypass
 > intended memory-read restrictions via a crafted app.

 > For more details, see the announcement:
 > https://webkitgtk.org/2017/07/24/webkitgtk2.16.6-released.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
