From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Apr 2020 10:09:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/ntp: bump to version 4.2.8p14
In-Reply-To: <20200330112144.3051-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Mon, 30 Mar 2020
 13:21:44 +0200")
References: <20200330112144.3051-1-sebastien.szymanski@armadeus.com>
Message-ID: <87k12x56sp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > "This release fixes three security issues in ntpd and provides 46
 > bugfixes and addresses 4 other issues." [1]

 > [1] http://support.ntp.org/bin/view/Main/SecurityNotice#March_2020_ntp_4_2_8p14_NTP_Rele

Then this should be marked as security bump. You also didn't mention why
the hash of the COPYRIGHT file changed.

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
 > ---

 > It also seems that the ntp-4.2.8p13.tar.gz file has changed and thus the
 > hashes are wrong.

Indeed, funky. Upstream must have updated the tarball later on. The
new tarball contains significant differences:

 304 files changed, 5751 insertions(+), 13323 deletions(-)

Committed after extending the commit message, thanks.

-- 
Bye, Peter Korsgaard
