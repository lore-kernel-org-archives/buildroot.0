From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:30:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version
 7.2.5
In-Reply-To: <20180428095735.954-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 28 Apr 2018 11:57:35 +0200")
References: <20180428095735.954-1-bernd.kuhls@t-online.de>
Message-ID: <87vac7kf3r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Changelog: http://www.php.net/ChangeLog-7.php#7.2.5
 > This release fixes several security-related bugs for which no CVE id's
 > are assigned at the time of writing:

 > https://bugs.php.net/bug.php?id=76129
 > https://bugs.php.net/bug.php?id=76130
 > https://bugs.php.net/bug.php?id=76248
 > https://bugs.php.net/bug.php?id=76249

 > Removed patch 0007, applied upstream:
 > https://github.com/php/php-src/commit/2842aa2a078eb1cad55540b61e7edf111395150d

 > Re-numbered patch 0009 -> 0007.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
