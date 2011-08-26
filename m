From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Aug 2011 14:02:09 +0200
Subject: [Buildroot] [PATCH 14/28] grub: convert to AUTOTARGETS
In-Reply-To: <4E4F7CCD.8030407@gmail.com> (Darius Augulis's message of "Sat,
 20 Aug 2011 12:22:21 +0300")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <20a318776db62b41f3bb365d2417e6251fc2d8ea.1309895466.git.thomas.petazzoni@free-electrons.com>
 <4E4F7CCD.8030407@gmail.com>
Message-ID: <87aaawqt32.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




>>>>> "Darius" == Darius Augulis <augulis.darius@gmail.com> writes:

 Darius> Hi Thomas,

 Darius> with these changes grub is not installed to staging dir.
 Darius> grub.mk has label:

 Darius> define GRUB_INSTALL_STAGING_CMDS
 Darius>         install -m 0755 -D $(@D)/grub/grub $(STAGING_DIR)/sbin/grub
 Darius> endef

 Darius> but when building it's installed only to target dir, but not to
 Darius> staging.

Ahh yes. What is the use case for installing grub into staging? Does it
make any sense to do so?

-- 
Bye, Peter Korsgaard
