From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 09:56:52 +0100
Subject: [Buildroot] [PATCHv2] openocd: avoid documentation rebuild to
	fix build issues
In-Reply-To: <1488147736-9778-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 26 Feb 2017 23:22:16 +0100")
References: <1488147736-9778-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87varuk817.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > On PowerPC64(le), we patch all configure scripts. Due to this, the
 > version.texi in OpenOCD files gets regenerated, and then since it has
 > a newer date than openocd.info, openocd build system rebuilds the
 > documentation. Unfortunately, this documentation rebuild fails on old
 > machines.

 > We work around this by faking the date of the generated version.texi
 > file, to make the build system believe the documentation doesn't need
 > to be regenerated.

 > Fixes:

 >   http://autobuild.buildroot.net/results/3cbe65a46e75b8e67846d593884c96df97dec7a4

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Changes since v1: fix commit title

Committed, thanks.

-- 
Bye, Peter Korsgaard
