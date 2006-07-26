From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed Jul 26 08:53:30 2006
Subject: [Buildroot] HowTo make jffs2 image after linux.mk?
In-Reply-To: <ecb4efd10607260820u199c122ci4c52233a0b785134@mail.gmail.com>
References: <20060726135221.GB8832@synertronixx3>
	<ecb4efd10607260820u199c122ci4c52233a0b785134@mail.gmail.com>
Message-ID: <20060726155323.GA14849@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2006-07-26 11:20 -0400 schrieb Clem Taylor:

> In my buildroot tree, I did the same thing the gumstix folks did. I

gumstix? I did not found gunstix stuff there...

> added a TARGET_FS target to the end of the world target list and moved
> all the all the *root targets from TARGETS to TARGET_FS. This way the
> jffs2 target is always built last.

I removed the last three lines of target/jffs2/jffs2root.mk
and added jffs2root to "all:   world" in main Makefile for now...

Regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
