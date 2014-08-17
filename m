From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Aug 2014 09:14:03 +0200
Subject: [Buildroot] [PATCH] configs/{atngw100,
	atstk100x}: fix build of AVR32 defconfigs
In-Reply-To: <1408175061-13238-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 16 Aug 2014 09:44:21 +0200")
References: <1408175061-13238-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqa7y4ec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since we marked the AVR32 architecture deprecated, it can no longer be
 > selected in a normal configuration. This has caused the AVR32
 > defconfigs to fail to build in our daily Jenkins tests. In order to
 > make them build again, they must use BR2_DEPRECATED=y. Of course, when
 > we remove AVR32 completely, we'll remove those defconfigs as well.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
