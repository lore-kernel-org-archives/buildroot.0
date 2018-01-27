From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 11:21:26 +0100
Subject: [Buildroot] [PATCH] package/physfs: needs threads support
In-Reply-To: <1516370369-21683-1-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Fri, 19 Jan 2018 14:59:29 +0100")
References: <1516370369-21683-1-git-send-email-romain.naour@smile.fr>
Message-ID: <87h8r7haah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > When physfs is build for a Linux system the PHYSFS_PLATFORM_POSIX
 > (which enable code that use pthread_*()) symbol must defined,
 > so threads support is required.
 > The physfs build system used by the previous version didn't correctly
 > set PHYSFS_PLATFORM_POSIX for system without pthread support.

 > Add pthread dependency.

 > Fixes:
 > http://autobuild.buildroot.org/results/75d/75d68ff9da42d61f47d80b463445c12bc51ed1a4

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
