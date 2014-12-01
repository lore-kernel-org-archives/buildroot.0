From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:10:14 +0100
Subject: [Buildroot] [PATCHv3 29/74] wipe: don't install man pages
In-Reply-To: <20141130170003.GI4124@free.fr> (Yann E. MORIN's message of "Sun, 
 30 Nov 2014 18:00:03 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-30-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141130170003.GI4124@free.fr>
Message-ID: <87y4qr9g3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
 >> index 4deabab..ee4682c 100644
 >> --- a/package/wipe/wipe.mk
 >> +++ b/package/wipe/wipe.mk
 >> @@ -13,7 +13,6 @@ WIPE_LICENSE_FILES = LICENSE
 >> 
 >> define WIPE_INSTALL_TARGET_CMDS
 >> $(INSTALL) -D $(@D)/wipe $(TARGET_DIR)/usr/bin/wipe

 > Maybe this should include -m 0755 as well?

I agree. I've added a patch to do this.

-- 
Bye, Peter Korsgaard
