From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 14:24:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.8.5
In-Reply-To: <20200720191703.46515-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 20 Jul 2020 21:17:03 +0200")
References: <20200720191703.46515-1-bernd.kuhls@t-online.de>
Message-ID: <87v9ifg2kj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes CVE-2020-15801 & CVE-2019-20907.
 > Changelog:
 > https://docs.python.org/release/3.8.5/whatsnew/changelog.html

NIT: CVE-2020-15801 is a Windows-only issue, so not applicable here.

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
