From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 May 2014 23:27:51 +0200
Subject: [Buildroot] [PATCH] toolchain-buildroot: only allow the
	selection of Musl for Microblaze BE
In-Reply-To: <1401481549-23804-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 30 May 2014 22:25:49 +0200")
References: <1401481549-23804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sinr6joo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The Musl C library only supports Microblaze BE, not Microblaze LE, so
 > this commit adjusts the dependencies of the toolchain-buildroot
 > package to not allow the selection of Musl on Microblaze LE.

 > Cc: William Welch <bvwelch@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
