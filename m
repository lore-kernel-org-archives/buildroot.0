From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Oct 2013 22:54:25 +0200
Subject: [Buildroot] [PATCH] lvm2: bump to version 2.02.103 and add
	license information
In-Reply-To: <1381195908.12897.2.camel@phoenix> (Axel Lin's message of "Tue,
 08 Oct 2013 09:31:48 +0800")
References: <1381195908.12897.2.camel@phoenix>
Message-ID: <87a9ij5vr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel>  package/lvm2/lvm2.mk | 4 +++-
 Axel>  1 file changed, 3 insertions(+), 1 deletion(-)

 Axel> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
 Axel> index 873216c..07c0d94 100644
 Axel> --- a/package/lvm2/lvm2.mk
 Axel> +++ b/package/lvm2/lvm2.mk
 Axel> @@ -4,10 +4,12 @@
 Axel>  #
 Axel>  ################################################################################
 
 Axel> -LVM2_VERSION = 2.02.79
 Axel> +LVM2_VERSION = 2.02.103
 Axel>  LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 Axel>  LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 Axel>  LVM2_INSTALL_STAGING = YES
 Axel> +LVM2_LICENSE = GPLv2+ LGPLv2.1+
 Axel> +LVM2_LICENSE_FILES = COPYING COPYING.LIB

I see no hits of 'any later version' in any of the source files, and
Debian also lists it without the +:

http://ftp-master.metadata.debian.org/changelogs//main/l/lvm2/lvm2_2.02.95-7_copyright

So I've dropped those and committed, thanks.

-- 
Bye, Peter Korsgaard
