From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 16:18:57 +0200
Subject: [Buildroot] [PATCH 07/10] gcc: remove versions 4.3.x and 4.6.x
In-Reply-To: <1404237789-15563-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 1 Jul 2014 20:03:06 +0200")
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ha2ppa9a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Those gcc series are old and are not used as the default versions for
 > any of the architectures we support, so this commit gets rid of them.

 > The gcc 4.3.x series technically remains used by the LPC32xx
 > defconfigs we have:

 > configs/ea3250_defconfig:BR2_GCC_VERSION_4_3_X=y
 > configs/fdi3250_defconfig:BR2_GCC_VERSION_4_3_X=y
 > configs/phy3250_defconfig:BR2_GCC_VERSION_4_3_X=y

 > Back when those defconfigs were introduced, gcc 4.3 was chosen because
 > it was the only one capable of building a fully working kernel for
 > those ARM-based platforms. However, the original submitter, Alexandre
 > Belloni, no longer has access to the hardware platforms, so he is
 > unable to test if newer gcc versions have fixed the problem. It
 > certainly doesn't make sense to keep gcc 4.3.x just for those three
 > boards, so we'll wait for someone actually using those defconfigs to
 > complain.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
