From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:28:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libplist: security bump to
 version 2.0.0
In-Reply-To: <20171105145852.2494-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 5 Nov 2017 15:58:52 +0100")
References: <20171105145852.2494-1-bernd.kuhls@t-online.de>
Message-ID: <87shd0hji6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://github.com/libimobiledevice/libplist/blob/master/NEWS

 > This version bump fixes
 >   * CVE-2017-6440
 >   * CVE-2017-6439
 >   * CVE-2017-6438
 >   * CVE-2017-6437
 >   * CVE-2017-6436
 >   * CVE-2017-6435
 >   * CVE-2017-5836
 >   * CVE-2017-5835
 >   * CVE-2017-5834
 >   * CVE-2017-5545
 >   * CVE-2017-5209
 > ... and several others that didn't receive any CVE (yet).

 > The dependency to libxml2 was removed.
 > Autoreconf is not needed anymore, the upstream tarball includes a
 > configure script.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
