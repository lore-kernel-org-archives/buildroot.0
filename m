From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 11:19:58 +0100
Subject: [Buildroot] [PATCH v3] libfcgi:add security patch for
	CVE-2012-6687
In-Reply-To: <1456813316-15720-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 (Niranjan Reddy's message of "Tue, 1 Mar 2016 11:51:56 +0530")
References: <1456813316-15720-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <87io16mre9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Niranjan" == Niranjan Reddy <niranjan.reddy@rockwellcollins.com> writes:

 > Fix-CVE-2012-6687 - remote attackers cause a denial of service (crash)
 > via a large number of connections (http://www.cvedetails.com/cve/CVE-2012-6687/).
 > use poll in os_unix.c instead of select to avoid problem with > 1024 connections.
 > The patch libfcgi_2.4.0-8.3.debian.tar.xz is taken from the below link:
 > (https://launchpad.net/ubuntu/+source/libfcgi/2.4.0-8.3)
 > The next release of libfcgi is 2.4.1 which may have this fix is yet to be released
 > officially.

 > Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
 > ---
 > Changes v2 -> v3:
 >   - Added signed-off-by line:Niranjan Reddy <niranjan.reddy@rockwellcollins.com>

 > Changes v1 -> v2:
 >   - Added signed-off-by line of the author : Anton Kortunov <toshic.toshic@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
