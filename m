From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Sep 2017 21:46:36 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: add upstream security fix
	for	CVE-2017-1000250
In-Reply-To: <es4v8exukd.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Sat, 16 Sep 2017 10:44:30 +0200")
References: <20170913121955.21236-1-peter@korsgaard.com>
 <es4v8exukd.ln2@ID-313208.user.individual.net>
Message-ID: <874ls13y77.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Wed, 13 Sep 2017 14:19:55 +0200 schrieb Peter Korsgaard:
 >> Fixes CVE-2017-1000250 - All versions of the SDP server in BlueZ 5.46
 >> and earlier are vulnerable to an information disclosure vulnerability
 >> which allows remote attackers to obtain sensitive information from the
 >> bluetoothd process memory.  This vulnerability lies in the processing of
 >> SDP search attribute requests.

 > Hi,

 > this patch was is included in upstream release 5.47 and can be marked as 
 > superseded by this patch: http://patchwork.ozlabs.org/patch/814482/

Yes, now that 5.47 is out, bumping the version makes more sense.

-- 
Bye, Peter Korsgaard
