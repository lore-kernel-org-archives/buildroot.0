From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 12:03:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to
 7.4.3
In-Reply-To: <87h7yqitr3.fsf@tarshish> (Baruch Siach's message of "Sat, 14 Mar
 2020 22:09:04 +0200")
References: <20200220223339.985987-1-bernd.kuhls@t-online.de>
 <87k13nxbw6.fsf@dell.be.48ers.dk> <87h7yqitr3.fsf@tarshish>
Message-ID: <8736a9khhc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sat, Mar 14 2020, Peter Korsgaard wrote:
 >>>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> 
 >> > Changelog: https://www.php.net/ChangeLog-7.php#7.4.3
 >> > Fixes CVE-2020-7061, CVE-2020-7062 & CVE-2020-7063.
 >> 
 >> > Removed patch applied upstream:
 >> > https://github.com/php/php-src/commit/f0f5c415a6e0abc40514f97113deb52a343174ee
 >> 
 >> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> 
 >> For 2019.02.x and 2019.11.x I have instead bumped to 7.3.15, which
 >> contains the same fixes.

 > php is still 7.3.14 in 2019.02.x as of commit a8cf4afce17f.

Ups, indeed - Fixed. Thanks!

-- 
Bye, Peter Korsgaard
