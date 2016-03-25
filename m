From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 23:15:57 +0100
Subject: [Buildroot] [PATCH v2 1/2] Add SVN repository support for u-boot
In-Reply-To: <1458234472-4741-2-git-send-email-susundberg@gmail.com> (Pauli
 Sundberg's message of "Thu, 17 Mar 2016 19:07:51 +0200")
References: <87oaaif6zv.fsf@dell.be.48ers.dk>
 <1458234472-4741-1-git-send-email-susundberg@gmail.com>
 <1458234472-4741-2-git-send-email-susundberg@gmail.com>
Message-ID: <87mvpmdx0i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pauli" == Pauli Sundberg <susundberg@gmail.com> writes:

You forgot to add your signed-off-by (git commit -s), so I cannot apply
this. Care to add that (and fix the below) and resend?

 > ---
 >  boot/uboot/Config.in | 9 ++++++---
 >  boot/uboot/uboot.mk  | 4 +++-
 >  2 files changed, 9 insertions(+), 4 deletions(-)

 > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
 > index 0e79734..5800060 100644
 > --- a/boot/uboot/Config.in
 > +++ b/boot/uboot/Config.in
 > @@ -51,6 +51,9 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 >  config BR2_TARGET_UBOOT_CUSTOM_GIT
 >  	bool "Custom Git repository"
 
 > +config BR2_TARGET_UBOOT_CUSTOM_SVN
 > +	bool "Custom SVN repository"
 > +
 >  config BR2_TARGET_UBOOT_CUSTOM_HG
 >  	bool "Custom Mercurial repository"

S still comes after H in the alphabet, so please add SVN after
_HG. While we're at it I think we should spell out Subversion instead of
SVN.

Thanks.

-- 
Bye, Peter Korsgaard
