From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 22:46:24 +0200
Subject: [Buildroot] [PATCH/next] glibc: remove unnecessary !BR2_sparc
	dependencies
In-Reply-To: <1471702321-31840-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 20 Aug 2016 16:12:01 +0200")
References: <1471702321-31840-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a8g4pm5b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The BR2_TOOLCHAIN_BUILDROOT_GLIBC option is already not selectable on
 > BR2_sparc, so there is no need to have an additional "depends on
 > !BR2_sparc" on each of the glibc versions.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
