From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Nov 2016 22:45:57 +0100
Subject: [Buildroot] [PATCH v2] jasper: bump version to 2.0.0 (security)
In-Reply-To: <20161128215347.0686379f@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 28 Nov 2016 21:53:47 +0100")
References: <20161128134134.18599-1-Vincent.Riera@imgtec.com>
 <20161128215347.0686379f@free-electrons.com>
Message-ID: <87bmwze0ru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 28 Nov 2016 13:41:34 +0000, Vicente Olivert Riera wrote:
 >> Fixed CVEs:
 >> - CVE-2016-9387
 >> - CVE-2016-9388
 >> - CVE-2016-9389
 >> - CVE-2016-9390
 >> - CVE-2016-9391
 >> - CVE-2016-9392
 >> - CVE-2016-9393
 >> - CVE-2016-9394
 >> - CVE-2016-9395
 >> - CVE-2016-9396
 >> - CVE-2016-9397
 >> - CVE-2016-9398
 >> - CVE-2016-9399
 >> - CVE-2016-9557
 >> - CVE-2016-9560
 >> 
 >> Changes to jasper.mk:
 >> - Switched to CMake package infrastructure.

 > Do we really need to bump to 2.0.0 to get those security fixes?
 > Changing the package to CMake is a big change, which I'm not sure I
 > want to merge that close to the final release.

 > I see we have 1.900.22 currently, while there is also a 1.900.29
 > version released upstream. Does this version also includes the security
 > fixes perhaps?

Indeed. There is also a .30 and .31, and as far as I can see the only
difference between 1.900.31 and 2.0 is cmake and some travis
stuff. Looking at the CVE numbers on the Debian security tracker they
all seem to refer to earlier commits - E.G.:

https://security-tracker.debian.org/tracker/CVE-2016-9560

Vicente, can you send a minimal patch updating to 1.900.31 for 2016.11
and then a followup patch once 2016.11 is out to bump to 2.0?

-- 
Bye, Peter Korsgaard
