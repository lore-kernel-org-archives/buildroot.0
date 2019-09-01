From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Sep 2019 22:08:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/collectd: security bump to
 version 5.9.0
In-Reply-To: <20190804150957.7844-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 4 Aug 2019 17:09:57 +0200")
References: <20190804150957.7844-1-bernd.kuhls@t-online.de>
 <20190804150957.7844-2-bernd.kuhls@t-online.de>
Message-ID: <875zmb3hlb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed patches applied upstream.
 > Added upstream sha1 & sha512 hashes.

 > Removed libltdl/COPYING.LIB from LICENSE_FILES after upstream removal
 > in version 5.8.0:
 > https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=7ea5a07f10c0334f9b0f32480590b2c848577559;hb=HEAD#l90

 > Version 5.7.2 fixed CVE-2017-7401
 > https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=7ea5a07f10c0334f9b0f32480590b2c848577559;hb=HEAD#l285

For 2019.02.x and 2019.05.x I have instead bumped the version to 5.7.2.

-- 
Bye, Peter Korsgaard
