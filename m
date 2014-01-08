From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Jan 2014 23:09:47 +0100
Subject: [Buildroot] [PATCH v3] evemu: new package
In-Reply-To: <1389197108-20536-1-git-send-email-anaumann@ultratronik.de>
 (Andreas Naumann's message of "Wed, 8 Jan 2014 17:05:08 +0100")
References: <1389197108-20536-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <87zjn6m8gk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Naumann <anaumann@ultratronik.de> writes:

 > Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
 > ---
 >  package/Config.in       |  1 +
 >  package/evemu/Config.in |  7 +++++++
 >  package/evemu/evemu.mk  | 22 ++++++++++++++++++++++
 >  3 files changed, 30 insertions(+)
 >  create mode 100644 package/evemu/Config.in
 >  create mode 100644 package/evemu/evemu.mk

Committed with a fix to not generate manpages if the host has asciidoc
available, thanks.

-- 
Bye, Peter Korsgaard
