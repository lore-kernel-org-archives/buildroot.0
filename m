From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:48:06 +0200
Subject: [Buildroot] [PATCH 6/9] gdb: specify hashes for the ARC and
	Microblaze versions
In-Reply-To: <1463436782-17051-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 00:12:59 +0200")
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463436782-17051-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87twhxch95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > On ARC and Microblaze, a special GDB version is used, fetched from
 > Github in both cases. Now that we consider Github generated tarballs
 > to be stable, we can specify hashes for those versions, rather than
 > using the special "none" hash to skip the hash check.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
