From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Apr 2016 12:09:39 +0200
Subject: [Buildroot] [PATCH v3 04/10] toolchain-buildroot: update glibc
	comment for noMMU
In-Reply-To: <1459450815-6494-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 31 Mar 2016 21:00:09 +0200")
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1459450815-6494-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mvp4pg2k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > glibc is not available for noMMU platforms, so it doesn't make sense
 > to show the comment about glibc requiring dynamic libraries on noMMU
 > platforms.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
