From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:13:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to
 7.4.3
In-Reply-To: <20200220223339.985987-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 20 Feb 2020 23:33:39 +0100")
References: <20200220223339.985987-1-bernd.kuhls@t-online.de>
Message-ID: <87k13nxbw6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Changelog: https://www.php.net/ChangeLog-7.php#7.4.3
 > Fixes CVE-2020-7061, CVE-2020-7062 & CVE-2020-7063.

 > Removed patch applied upstream:
 > https://github.com/php/php-src/commit/f0f5c415a6e0abc40514f97113deb52a343174ee

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

For 2019.02.x and 2019.11.x I have instead bumped to 7.3.15, which
contains the same fixes.

-- 
Bye, Peter Korsgaard
