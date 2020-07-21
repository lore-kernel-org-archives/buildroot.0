From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 07:58:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 7.4.8
In-Reply-To: <20200710145316.156434-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Jul 2020 16:53:16 +0200")
References: <20200710145316.156434-1-bernd.kuhls@t-online.de>
Message-ID: <87sgdlo1d7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Quoting https://www.php.net/
 > "For windows users running an official build, this release contains a
 >  patched version of libcurl addressing CVE-2020-8159.

 > For all other consumers of PHP, this is a bug fix release."

 > Changelog: https://www.php.net/ChangeLog-7.php#7.4.8

Committed to 2020.02.x and 2020.05.x given that the changelog talks
about invalid memory access and segfaults, thanks.

-- 
Bye, Peter Korsgaard
