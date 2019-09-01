From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Sep 2019 11:03:06 +0200
Subject: [Buildroot] [PATCH] package/libnss: security bump to version
 3.46
In-Reply-To: <87ef10brmq.fsf@tarshish> (Baruch Siach's message of "Sun, 01 Sep
 2019 06:51:57 +0300")
References: <20190831204033.93610-1-giulio.benetti@micronovasrl.com>
 <36a5f792-cb9d-0873-6efb-76a36e2267d6@micronovasrl.com>
 <87ef10brmq.fsf@tarshish>
Message-ID: <87o904fkxh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Giulio,
 > On Sat, Aug 31 2019, Giulio Benetti wrote:
 >> Subject should be: "package/libnss: bump to version 3.46" without
 >> 'security'.

 > This bump fixes CVE-2019-11727 and CVE-2019-11719. The commit log should
 > mention that though.

Judging from the release notes, you also need to bump libnspr:

https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.46_release_notes

NSS 3.46 requires NSPR 4.22 or newer.

Given that I plan on releasing 2019.08 tonight, this will most likely
have to wait for 2019.08.1.

-- 
Bye, Peter Korsgaard
