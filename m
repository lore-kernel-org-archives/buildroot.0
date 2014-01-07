From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Jan 2014 10:23:31 +0100
Subject: [Buildroot] [PATCH] grub: bump to 0.97-67
In-Reply-To: <20140107163239.6999bd1c@skate> (Thomas Petazzoni's message of
 "Tue, 7 Jan 2014 16:32:39 +0800")
References: <1386191460-10848-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140107163239.6999bd1c@skate>
Message-ID: <874n5gxi0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed,  4 Dec 2013 22:11:00 +0100, Thomas Petazzoni wrote:
 >> Bump to a more recent version of the Debian patches for grub legacy,
 >> that fix an incorrect build with gcc 4.6.
 >> 
 >> Fixes #6092 and #2629.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 >> ---
 >> boot/grub/grub.200-fix_mbr_handling.patch     |   10 +-
 >> boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |   14 +-
 >> boot/grub/grub.400-nic_update2.patch          | 3332 ++++---------------------
 >> boot/grub/grub.mk                             |    6 +-
 >> 4 files changed, 475 insertions(+), 2887 deletions(-)

 > Any reason why this patch was never applied? Interestingly, I don't see
 > it anymore in patchwork, but it wasn't applied either.

Odd, it must somehow have fallen between the crack ..

 > Could it be applied?

Sure, done - Thanks.

-- 
Bye, Peter Korsgaard
